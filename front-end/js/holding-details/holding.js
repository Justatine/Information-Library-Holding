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
                        <div class="bg-gray-50 hover:bg-gray-100 flex flex-wrap justify-between p-4 rounded-lg mt-2">
                            <div>
                                <h4 class="holding-title font-bold">${index+1}.  ${element.title}</h4>
                                <div id="helper-text-explanation" class="mt-2 text-sm text-gray-500 dark:text-gray-400">
                                    <p><strong>Author: </strong>${element.author}</p>
                                    <p><strong>Year Published: </strong>${element.published_year}</p>
                                    
                                    <p id="helper-text-explanation" class="mt-2 text-sm text-gray-500 dark:text-gray-400">
                                        <span class="font-semibold">Keywords: </span> 
                                        <span class="bg-gray-200 p-1 rounded-lg">${element.keyword}</span>
                                    </p>

                                </div>
                            </div>
                            <div class="mt-2">
                                <a href="book-details.html?holdingid=${element.hold_id}"> 
                                    <button type="button" class="text-white bg-[#FEB440] hover:bg-[#3F1D22] focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 md:px-5 md:py-2.5 me-2 mb-2 focus:outline-none">Book Details</button>   
                                </a>
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