// Retrieve the subject ID from the cookie
const RsubId = getCookie('res-subId');

// Global variable to store filtered holdings
let filteredHoldingsData = [];
let currentPage = 1;  // Starting page (global)
const rowsPerPage = 5; // Number of holdings per page (global)
let authorsData = {};

// Function to display holdings that match the subject ID
function displayHoldingsWithMatchingSubject() {
    // Fetch authors data first
    $.when(getAuthorsData()).done(function() {
        // After fetching authors, fetch holdings
        $.ajax({
            url: 'https://ilibrary.zreky.muccs.host/back-end/api-holding/v1/holdings', // API endpoint
            type: 'GET', // GET request to retrieve data
            dataType: 'json', // Expecting JSON data
            success: function(data) {
                // Filter holdings based on the subject matching RsubId
                filteredHoldingsData = data.filter(holding => {
                    try {
                        // Check if subjects field is a valid JSON string
                        if (isValidJson(holding.subjects)) {
                            const subjectsArray = JSON.parse(holding.subjects);

                            // Check if any subject's id matches the RsubId
                            return subjectsArray.some(subject => subject.id === RsubId);
                        }
                    } catch (error) {
                        return false; // If invalid JSON or no match, exclude this holding
                    }
                    return false;
                });

                // Display the filtered holdings on the first page
                displayPaginatedHoldings(currentPage);
            },
            error: function(xhr, status, error) {
                console.error('Error fetching data:', error);
            }
        });
    });
}


// Function to check if a string is valid JSON
function isValidJson(subjects) {
    if (typeof subjects !== 'string') {
        return false;
    }

    try {
        JSON.parse(subjects);
        return true;
    } catch (e) {
        return false;
    }
}

// Function to display filtered holdings in the UI
function displayFilteredHoldings(filteredHoldings) {
    const contentContainer = $('.content-container');

    // If no holdings match the subject, display a message
    if (filteredHoldings.length === 0) {
        contentContainer.html("<p>No holdings found with the matching subject.</p>");
        return;
    }

    // Create HTML to display filtered holdings
    let holdingsHtml = '';
    filteredHoldings.forEach(holding => {
        const authorName = authorsData[holding.author_id] || 'Unknown Author'; // Get author name
        const subjectsDisplay = getSubjectsDisplay(holding.subjects); // Get formatted subjects

        holdingsHtml += `
            <div class="holding-card" data-holding-id="${holding.hold_id}">
                <h4 class="holding-title">${holding.title}</h4>
                <div class="sml-info">
                    <p>
                        <strong>Author:</strong> ${authorName}<br>
                        <strong>Copies:</strong> ${holding.copies}<br>
                        <strong>Subjects:</strong> ${subjectsDisplay}
                    </p>
                </div>
            </div>
        `;
    });

    // Insert the HTML into the content-container
    contentContainer.html(holdingsHtml);

    // Add click event listener to each holding card
    $('.holding-card').on('click', function () {
        const holdingId = $(this).data('holding-id');
        setCookie("DholdId", holdingId, 7);
        window.location.href = `holding-details.html`; // Redirect to details page with holding ID
    });
}

// Function to get authors data using promises
function getAuthorsData() {
    return $.ajax({
        url: `https://ilibrary.zreky.muccs.host/back-end/api-author/v1/authors`, // API endpoint to get authors
        type: 'GET',
        success: function (data) {
            authorsData = mapAuthorsData(data); // Map authors data to ID
        },
        error: function (xhr, status, error) {
            console.error('Error fetching authors:', error);
        }
    });
}

// Function to map authors data by their ID
function mapAuthorsData(data) {
    let authorsMap = {};
    data.forEach(author => {
        authorsMap[author.author_id] = `${author.fname} ${author.lname}`;
    });
    return authorsMap;
}

// Function to get the subjects display (assuming subjects is a JSON string)
function getSubjectsDisplay(subjects) {
    let subjectsArray;

    // Check if subjects is already an array
    if (Array.isArray(subjects)) {
        subjectsArray = subjects;
    } else {
        try {
            // Ensure the data is a valid JSON string before parsing
            subjects = subjects.trim();
            if (isValidJson(subjects)) {
                subjectsArray = JSON.parse(subjects);
            } else {
                return 'No subjects available';
            }
        } catch (error) {
            return 'No subjects available';
        }
    }

    // Map through the subjects array and join them by commas
    return subjectsArray.map(subject => subject.value).join(', ') || 'No subjects available';
}

// Call the function to display holdings with matching subjects
displayHoldingsWithMatchingSubject();

// Function to display filtered holdings for the current page
function displayPaginatedHoldings(page) {
    const contentContainer = $('.content-container');

    // Calculate the start and end index for the current page
    const startIndex = (page - 1) * rowsPerPage;
    const endIndex = Math.min(page * rowsPerPage, filteredHoldingsData.length);
    const currentPageHoldings = filteredHoldingsData.slice(startIndex, endIndex);

    // Display the filtered holdings in the UI (no changes made here)
    displayFilteredHoldings(currentPageHoldings);

    // Setup pagination buttons
    setupPagination(filteredHoldingsData.length);
}

// Function to setup pagination with limited visible page buttons
function setupPagination(totalItems) {
    const totalPages = Math.ceil(totalItems / rowsPerPage);
    const pageNumbersContainer = $('#page-numbers');
    pageNumbersContainer.empty();

    const maxVisiblePages = 3; // Limit the number of visible page buttons
    let startPage = Math.max(1, currentPage - Math.floor(maxVisiblePages / 2));
    let endPage = Math.min(totalPages, startPage + maxVisiblePages - 1);

    // Adjust startPage if reaching the end of total pages
    if (endPage - startPage < maxVisiblePages) {
        startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }

    // Add page numbers dynamically
    for (let i = startPage; i <= endPage; i++) {
        pageNumbersContainer.append(`<button class="page-btn" data-page="${i}">${i}</button>`);
    }

    // Update the pagination buttons state (Prev/Next buttons)
    updatePaginationButtons(totalPages);

    // Page number button click handler
    $('.page-btn[data-page]').click(function () {
        currentPage = parseInt($(this).data('page'));
        displayPaginatedHoldings(currentPage);
    });
}

// Function to update the pagination buttons (prev, next)
function updatePaginationButtons(totalPages) {
    // Enable/Disable the 'Previous' button
    if (currentPage > 1) {
        $('#prev-btn').prop('disabled', false);
    } else {
        $('#prev-btn').prop('disabled', true);
    }

    // Enable/Disable the 'Next' button
    if (currentPage < totalPages) {
        $('#next-btn').prop('disabled', false);
    } else {
        $('#next-btn').prop('disabled', true);
    }
}

// Previous button click handler
$('#prev-btn').click(function () {
    if (currentPage > 1) {
        currentPage--;
        displayPaginatedHoldings(currentPage);
    }
});

// Next button click handler
$('#next-btn').click(function () {
    if (currentPage < Math.ceil(filteredHoldingsData.length / rowsPerPage)) {
        currentPage++;
        displayPaginatedHoldings(currentPage);
    }
});
