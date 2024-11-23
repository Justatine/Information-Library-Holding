$(document).ready(function () {
    const subjectId = getUrlParameter('subjectId');
    // console.log(subjectId); 

    $.ajax({
        type: "GET",
        url: url+"api-book/suggested-books.php",
        data: {id: subjectId},
        dataType: "json",
        success: function (response) {
            $("#subject-name").html(response.subject.name);
            var suggestedBooks = "";
            
            if (response.subject.suggestedBooks.length === 0) {
                suggestedBooks = '<p class="text-gray-500 p-4">No suggested books for this subject</p>';
            } else {
                $.map(response.subject.suggestedBooks, function (element, index) {
                    console.log(response.subject.suggestedBooks);

                    suggestedBooks += `
                        <div class="bg-gray-50 hover:bg-gray-100 flex flex-wrap justify-between p-4 rounded-lg mt-2" data-holding-id="${element.hold_id}">
                            <div>
                                <h4 class="holding-title font-bold">${index + 1}. ${element.title}</h4>
                                <div id="helper-text-explanation" class="mt-2 text-sm text-gray-500 dark:text-gray-400">
                                    <p><strong>Author: </strong>${element.authorName}</p>
                                    <p><strong>Copies: </strong>${element.copies}</p>
                                </div>
                            </div>
                            <div class="mt-2">
                                <a href="../book-details.html?holdingid=${element.hold_id}"> 
                                    <button type="button" class="text-white bg-[#FEB440] hover:bg-[#3F1D22] focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 md:px-5 md:py-2.5 me-2 mb-2 focus:outline-none">Book Details</button>   
                                </a>
                            </div>
                        </div>
                    `
                });
            }
            
            $("#suggested-subjects").html(suggestedBooks);
        }
    });
});