document.addEventListener('deviceready', function () {
    if (window.StatusBar) {
        StatusBar.overlaysWebView(false); // Ensure the app overlays the status bar
    }
    console.log('Device is ready');

    document.getElementById("exit-button").addEventListener("click", function (event) {
        event.preventDefault(); // Prevent any default behavior

        if (navigator.app) {
            navigator.app.exitApp(); // Cordova App exit for Android
        } else if (navigator.device) {
            navigator.device.exitApp(); // Alternatively, use the Cordova device API
        } else {
            console.log("Exit functionality is only available on Android in Cordova.");
        }
    });
}, false);

$(document).ready(function () {
    const ocrResult = sessionStorage.getItem('ocrResult');
    const proImageData = localStorage.getItem('proImageData');
    const imageData = localStorage.getItem('imageData');

    console.log('Image', imageData);
    console.log('Pro Image', proImageData);
    console.log('OCR Result:', ocrResult);

    document.getElementById('gallery-btn').addEventListener('click', function () {
        $('#imageTypeModal').modal('hide');
        document.getElementById('loading-indicator').style.display = 'flex';
        setTimeout(function () {
            window.location.href = 'upload1.html'; // Redirect to the gallery upload page
        }, 500);
    });

    document.getElementById('camera-btn').addEventListener('click', function () {
        $('#imageTypeModal').modal('hide');
        document.getElementById('loading-indicator').style.display = 'flex';
        setTimeout(function () {
            window.location.href = '../camera.html'; // Redirect to the camera page
        }, 500);
    });

    fetchSubjects()
        .then(subjects => {
            if (!Array.isArray(subjects)) {
                console.warn('Subjects is not an array:', subjects);
                subjects = Array.isArray(subjects.data) ? subjects.data : [];
            }

            const matchedSubjects = matchSubjects(ocrResult, subjects);
            console.log('Matched subjects:', matchedSubjects);

            const container = $('#matchedSubjectsContainer');
            container.empty();

            const courseAndYear = extractCourseAndYear(ocrResult);
            console.log('Extracted Course and Year:', courseAndYear);

            if (Array.isArray(matchedSubjects) && matchedSubjects.length > 0) {
                const filteredSubjects = matchedSubjects.filter(subject => {
                    if (!subject.crs_and_yr || !courseAndYear) return false;
                    return subject.crs_and_yr.replace(/\s+/g, '') === courseAndYear.replace(/\s+/g, '');
                });

                const addedSubjectIds = new Set(); // Track added subject IDs
                const addedSubjectNames = new Set(); // Track added subject names

                if (filteredSubjects.length > 0) {
                    filteredSubjects.forEach(subject => {
                        if (!addedSubjectIds.has(subject.id) && !addedSubjectNames.has(subject.name)) {
                            // Add the subject if not already added
                            addedSubjectIds.add(subject.id);
                            addedSubjectNames.add(subject.name);

                            const subjectHtml = `
                                <div class="result-card" data-subject-id="${subject.id}">
                                    <a href="#" style="text-decoration: none; color: inherit;">
                                        <div class="content1">
                                            <h2>${subject.name}</h2>
                                            <p>${subject.desc}</p>
                                            <p>${subject.crs_and_yr}</p>
                                        </div>
                                        <div class="content2">
                                            <span id="arrow">&gt;</span>
                                        </div>
                                    </a>
                                </div>`;
                            container.append(subjectHtml);
                        }
                    });
                } else {
                    container.append('<p>No subjects matched with the course and year.</p>');
                }
            } else {
                container.append('<p>No subjects matched with the OCR text.</p>');
            }
        })
        .catch(error => {
            console.error('Error fetching subjects:', error);
            $('#matchedSubjectsContainer').append('<p>Error fetching subjects. Please try again later.</p>');
        });

    $(document).on('click', '.result-card', function (event) {
        event.preventDefault(); // Prevent default anchor click behavior
        const subjectId = $(this).data('subject-id');
        window.location.href = `subject-holdings.html?subjectId=${subjectId}`; // Redirect to the desired page
    });
});
