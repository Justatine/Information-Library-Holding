$(document).ready(function () {
    const contentContainer = $('.content-container');
    const categoriesContainer = $('.categories-container');  // Container for categories
    let authorsData = {};
    let categoriesData = {};  // Store categories data
    let holdingsData = [];
    let currentPage = 1;
    const CholdId = getCookie('DholdId');
    const rowsPerPage = 5; // Number of rows per page

    // Function to fetch holdings using AJAX
    function fetchHoldings() {
        $.ajax({
            url: `https://ilibrary.zreky.muccs.host/back-end/api-holding/v1/holdings/${CholdId}`,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                holdingsData = data; // Store the fetched holdings data
    
                // Chain the authors and categories fetch requests
                $.when(fetchAuthorsData(), fetchCategoriesData(CholdId)).done(function () {
                    displayHoldings(currentPage); 
                    setupPagination(holdingsData.length);
                });
            },
            error: function (error) {
                console.error('Error fetching holdings:', error);
                contentContainer.html("<p>Failed to load holdings. Please try again later.</p>");
            }
        });
    }

    // Function to fetch authors data (returning a promise)
    function fetchAuthorsData() {
        return $.ajax({
            url: `https://ilibrary.zreky.muccs.host/back-end/api-author/v1/authors`,
            type: 'GET',
            success: function (data) {
                authorsData = mapAuthorsData(data); // Map authors data to ID
            },
            error: function (xhr, status, error) {
                console.error('Error fetching authors:', error);
            }
        });
    }

    // Function to fetch categories data (returning a promise)
    // Function to fetch categories data (returning a promise)
    function fetchCategoriesData(CholdId) {
        return $.ajax({
            url: `https://ilibrary.zreky.muccs.host/back-end/api-holding/v1/holdings/${CholdId}/category`,
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                categoriesData = data;
                console.log(categoriesData); // Store the categories data
                // Check if authorsData has been populated before calling displayCategories
                if (Object.keys(authorsData).length > 0) {
                    displayCategories(categoriesData); // Display categories if authorsData is already loaded
                } else {
                    // If authorsData is not yet populated, set up a watcher or retry to display categories
                    setTimeout(() => {
                        if (Object.keys(authorsData).length > 0) {
                            displayCategories(categoriesData); // Try displaying after authorsData is populated
                        }
                    }, 1000);
                }
            },
            error: function (error) {
                console.error('Error fetching categories:', error);
            }
        });
    }
    // Function to map authors data by their ID
    function mapAuthorsData(data) {
        let authorsMap = {};
        data.forEach(author => {
            authorsMap[author.author_id] = `${author.fname} ${author.lname}`; // Use backticks for string interpolation
        });
        return authorsMap;
    }

    // Function to display holdings in the content-container based on the current page
    function displayHoldings(page) {
        const startIndex = (page - 1) * rowsPerPage;
        const endIndex = startIndex + rowsPerPage;
        const holdingsToDisplay = holdingsData.slice(startIndex, endIndex);

        if (holdingsToDisplay.length === 0) {
            contentContainer.html("<p>No holdings available.</p>");
            return;
        }

        let holdingsHtml = '';
        $.each(holdingsToDisplay, function (index, holding) {
            let authorName = authorsData[holding.author_id] || 'Unknown';

            holdingsHtml += `
            <div class="header">
                <div class="title">
                    <h4 class="holding-title">${holding.title}</h4>
                </div>
            </div>
                        <div class="info1">
                            <p><strong>Author:</strong> ${authorName}</p>
                            <p><strong>Year published:</strong> ${holding.published_year}</p>
                            <p><strong>Categories:</strong> ${holding.category || 'No categories'}</p>
                        </div>
                    <div class="info-table">
                        <table class="info2">
                            <thead>
                                <tr>
                                    <th>Accession Number</th>
                                    <th>Call Number</th>
                                    <th>Available Copies</th>
                                    <th>Subjects related</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${holding.accss_num}</td>
                                    <td>${holding.call_num}</td>
                                    <td>${holding.av_copies}</td>
                                    <td>${getSubjectsDisplay(holding.subjects)}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            `;
        });

        // Insert the HTML into the content-container
        contentContainer.html(holdingsHtml);

        // Add click event listener to each holding card
        categoriesContainer.on('click', '.holding-card', function () {
            const holdingId = $(this).data('holding-id');
            setCookie("DholdId", holdingId, 7);
            window.location.href = `holding-details.html`; // Redirect to details page with holding ID
        });
    }

    function displayCategories(categoriesData) {
        // Show the title by default at the beginning of the function
        $("#suggestions-title").show();
    
        // Check if categoriesData is empty
        if (Object.keys(categoriesData).length === 0) {
            categoriesContainer.html("<p>No categories available.</p>");
            $("#suggestions-title").hide();  // Hide the suggestion title if no data
            return;
        }
    
        let categoriesHtml = '';
        $.each(categoriesData, function (holdingId, categories) {
            console.log(categories);  // Log the categories to inspect the structure
    
            // Access 'hold_id' directly from the 'categories' object
            let holdId = categories.hold_id || 'No hold_id';  // Default to 'No hold_id' if not available
            let title = categories.title || 'No title';
            let copies = categories.copies || 'No copies';
            let authorId = categories.author_id || '';
    
            // Retrieve the author's name from the authorsData map
            let authorName = 'Unknown Author';
            if (authorId && authorsData[authorId]) {
                authorName = authorsData[authorId];
            } else if (authorId) {
                console.warn(`Author ID ${authorId} not found in authorsData`);
            }
    
            // Create the HTML to display the correct information
            if (holdId !== CholdId) {
                categoriesHtml += `
                    <div class="holding-card" data-holding-id="${holdId}">
                        <h4 class="holding-title">${title}</h4>
                        <div class="sml-info">
                            <p>
                                <strong>Author:</strong> ${authorName}
                                <strong>Copies:</strong> ${copies}
                            </p>
                        </div>
                    </div>
                `;
            }
        });
    
        // Display a message if no categories were added
        if (categoriesHtml === '') {
            categoriesContainer.html("<p>No suggestions available.</p>");
            $("#suggestions-title").hide();  // Hide the suggestion title if no categories
        } else {
            categoriesContainer.html(categoriesHtml);
            $("#suggestions-title").show();  // Ensure the title is shown if there are categories
        }
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

        // Update the pagination buttons state
        updatePaginationButtons(totalPages);

        // Page number button click handler
        $('.page-btn[data-page]').click(function () {
            currentPage = parseInt($(this).data('page'));
            displayHoldings(currentPage);
            setupPagination(holdingsData.length); // Refresh pagination with the current page set
        });
    }

    // Update the Next, Previous, and active page buttons
    function updatePaginationButtons(totalPages) {
        $('#prev-btn').prop('disabled', currentPage === 1);
        $('#next-btn').prop('disabled', currentPage >= totalPages);

        // Highlight the current page button
        $('.page-btn[data-page]').removeClass('active');
        $(`.page-btn[data-page=${currentPage}]`).addClass('active');
    }

    function getSubjectsDisplay(subjects) {
        let subjectsArray;
    
        // Check if subjects is already an array
        if (Array.isArray(subjects)) {
            subjectsArray = subjects;
        } else {
            try {
                // Ensure the data is a valid JSON string before parsing
                subjects = subjects.trim();
                if (subjects.startsWith('[') && subjects.endsWith(']')) {
                    // Attempt to parse the JSON string
                    subjectsArray = JSON.parse(subjects);
                } else {
                    throw new Error('Invalid JSON format');
                }
            } catch (error) {
                console.error('Error parsing subjects:', error);
                return 'Invalid subjects format';
            }
        }
    
        // Map through the subjects array and join them by commas
        return subjectsArray.map(subject => subject.value).join(', ') || 'No subjects available';
    }
    
    

    // Previous button click handler
    $('#prev-btn').click(function () {
        if (currentPage > 1) {
            currentPage--;
            displayHoldings(currentPage);
            setupPagination(holdingsData.length);
        }
    });

    // Next button click handler
    $('#next-btn').click(function () {
        if (currentPage < Math.ceil(holdingsData.length / rowsPerPage)) {
            currentPage++;
            displayHoldings(currentPage);
            setupPagination(holdingsData.length);
        }
    });

    // Call fetchHoldings to load holdings when the page is ready
    fetchHoldings();
});