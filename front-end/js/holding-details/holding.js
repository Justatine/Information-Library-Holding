$(document).ready(function () {
    const holdingId = getUrlParameter('holdingid');
    // console.log(holdingId); 

    $.ajax({
        type: "GET",
        url: url+"api-book/book-details",
        data: { id:holdingId },
        dataType: "json",
        success: function (response) {
            console.log(response.data);
            $("#_title").html(response.data.title);
            $("#_author").html(response.data.author);
            
            var holding_display = "";  
            holding_display += `
                <div class="p-6 grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="space-y-4">
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Access Number</span>
                            <span class="text-base font-medium" id="_access_num">
                            ${response.data.accss_num}</span>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Call Number</span>
                            <span class="text-base font-medium" id="_call_num">${response.data.call_num}</span>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Published Year</span>
                            <span class="text-base font-medium" id="_published_year">${response.data.published_year}</span>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Course</span>
                            <span class="text-base font-medium" id="_course">${response.data.course}</span>
                        </div>
                    </div>

                    <div class="space-y-4">
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Available Copies</span>
                            <span class="text-base font-medium" id="_av_copies">${response.data.av_copies}</span>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Total Copies</span>
                            <span class="text-base font-medium" id="_copies">${response.data.copies}</span>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Subject Name</span>
                            <span class="text-base font-medium" id="_sub_name">${response.data.sub_name}</span>
                        </div>
                        <div class="flex flex-col">
                            <span class="text-sm text-gray-500">Keywords</span>
                            <span class="text-base font-medium" id="_keyword">${response.data.keyword}</span>
                        </div>
                    </div>
                </div>

                <div class="bg-gray-50 p-6 border-t border-gray-200">
                    <div class="flex items-center justify-between">
                        <div class="flex items-center space-x-2">
                            <span class="text-sm text-gray-500">Department:</span>
                            <span class="text-base font-medium" id="_department">${response.data.deptname}</span>
                        </div>
                        <div class="flex items-center space-x-2">
                            <span class="text-sm text-gray-500">Hold ID:</span>
                            <span class="text-base font-medium" id="_hold_id"># ${response.data.hold_id}  </span>
                        </div>
                    </div>
                </div>  
            `
            $("#holding-display").html(holding_display);
            
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