$(document).ready(function () {
    const holdingId = getUrlParameter('holdingid');
    // console.log(holdingId); 

    $.ajax({
        type: "GET",
        url: url+"api-book/book-details",
        data: { id:holdingId },
        dataType: "json",
        success: function (response) {
            // console.log(response.data);
            $("#_title").html(response.data.title);
            $("#_author").html(response.data.author);
            $("#_yearpublised").html(response.data.published_year);

            var suggested_books = "";
            if (response.data.suggested_books.length > 0) {
                $.map(response.data.suggested_books, function (element, index) {
                    suggested_books += `
                        <div class="bg-gray-50 hover:bg-gray-100 p-4 rounded-lg mt-2">
                            <h4 class="holding-title font-bold">${index+1}. <span class="bg-gray-200 p-1 rounded-lg">${element.title.split(' ')[0]}</span> ${element.title.split(' ').slice(1).join(' ')}</h4>
                            <div id="helper-text-explanation" class="mt-2 text-sm text-gray-500 dark:text-gray-400">
                                <p><strong>Author: </strong>${element.author}</p>
                                <p><strong>Year Published: </strong>${element.published_year}</p>
                            </div>
                        </div>
                    `
                });
            }else{
                suggested_books += `
                    <p>No suggested books found</p>
                `   
            }

            $("#_suggested-books").html(suggested_books);
        }
    });
});