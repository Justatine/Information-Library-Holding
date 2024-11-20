document.addEventListener('deviceready', function() {
    // Hide the status bar when the device is ready
    if (window.StatusBar) {
        StatusBar.overlaysWebView(false); // Ensure the app overlays the status bar
    }
    console.log('Device is ready');

    // Add the event listener for the exit button here
    document.getElementById("exit-button").addEventListener("click", function(event) {
        event.preventDefault();  // Prevent any default behavior
        
        // Cordova App exit for Android
        if (navigator.app) {
            navigator.app.exitApp();
        } 
        // Alternatively, use the Cordova device API
        else if (navigator.device) {
            navigator.device.exitApp();
        } 
        // Fallback if the exit functionality is not available
        else {
            console.log("Exit functionality is only available on Android in Cordova.");
        }
    });

}, false);

$(document).ready(function() {
    const ocrResult = sessionStorage.getItem('ocrResult');
    const proImageData = localStorage.getItem('proImageData');
    const imageData = localStorage.getItem('imageData');
    console.log('Image');
    console.log(imageData);
    console.log('Pro Image');
    console.log(proImageData);
    console.log('OCR Result:' + ocrResult);

        // Gallery button event listener
        document.getElementById('gallery-btn').addEventListener('click', function() {
            $('#imageTypeModal').modal('hide');
            document.getElementById('loading-indicator').style.display = 'flex';
            setTimeout(function() {
                // Redirect to the gallery upload page
                window.location.href = 'upload1.html';
            }, 500);
        });

        // Camera button event listener
        document.getElementById('camera-btn').addEventListener('click', function() {
            $('#imageTypeModal').modal('hide');
            document.getElementById('loading-indicator').style.display = 'flex';
            setTimeout(function() {
                // Redirect to the camera page
                window.location.href = '../camera.html';
            }, 500);
        });

    fetchSubjects().then(subjects => {
        // Ensure matchSubjects is called only after subjects are fetched
        const matchedSubjects = matchSubjects(ocrResult, subjects);
        
        console.log('Matched subjects:', matchedSubjects);

        const container = $('#matchedSubjectsContainer');
        container.empty();

        if (matchedSubjects && matchedSubjects.length > 0) {
            matchedSubjects.forEach(subject => {
                const subjectHtml = `<div class="result-card" data-subject-id="${subject.id}" color: inherit;">
                                        <a href="#" style="text-decoration: none; color: inherit;">
                                            <div class="content1">
                                                <h2>${subject.name}</h2>
                                                <p>${subject.desc}</p>
                                            </div>
                                            <div class="content2">
                                                <span id="arrow">&gt;</span> <!-- Greater than symbol -->
                                            </div>
                                        </a>
                                    </div>`;
                container.append(subjectHtml);
            });
        } else {
            container.append('<p>No subjects matched with the OCR text.</p>');
        }
    }).catch(error => {
        console.error('Error fetching subjects:', error);
        $('#matchedSubjectsContainer').append('<p>Error fetching subjects. Please try again later.</p>');
    });

    $(document).on('click', '.result-card', function(event) {
        event.preventDefault(); // Prevent default anchor click behavior

        const subjectId = $(this).data('subject-id'); 
        setCookie("res-subId", subjectId, 7);

        // Redirect to the desired page
        window.location.href = 'subject-holdings.html';
    });

    // Optionally, clear session storage if not needed anymore
    //sessionStorage.removeItem('ocrResult');
    //sessionStorage.removeItem('matchedSubjects');
});
