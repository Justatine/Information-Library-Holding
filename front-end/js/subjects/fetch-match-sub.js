// Function to fetch subjects from the API
function fetchSubjects() {
    return $.ajax({
        url: url+'api-subject/index.php',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log('Fetched subjects:', data.data);
            return data.data.subjects; 
        },
        error: function(err) {
            console.error('Error fetching subjects:', err);
            $('#ocrError').text('Error fetching subjects from the database. Please try again.');
            $('#ocrError').show();
        }
    });
}
// Function to match subjects with OCR text
function matchSubjects(ocrText, subjects) {
    let matchedSubjects = [];

    // Process the OCR text by converting it to lowercase
    const processedOcrText = ocrText.toLowerCase();
    console.log('Processed OCR Text:', processedOcrText); // Debug: Show the processed OCR text

    subjects.forEach(subject => {
        // Clean the subject name by converting to lowercase and removing spaces
        const subjectNameWithSpace = subject.sub_name ? subject.sub_name.toLowerCase() : '';
        const subjectNameWithoutSpace = subjectNameWithSpace.replace(/\s+/g, '');

        // Check if the subject with spaces matches the OCR text
        const regexWithSpaces = new RegExp(`\\b${subjectNameWithSpace}\\b`, 'i');
        const isMatchWithSpaces = regexWithSpaces.test(processedOcrText);

        // If no match with spaces, check for subject without spaces
        const regexWithoutSpaces = new RegExp(`\\b${subjectNameWithoutSpace}\\b`, 'i');
        const isMatchWithoutSpaces = regexWithoutSpaces.test(processedOcrText);

        // Add matched subject to the list if it doesn't already exist
        if ((isMatchWithSpaces || isMatchWithoutSpaces) &&
            !matchedSubjects.some(matched => matched.id === subject.sub_id)) {
            matchedSubjects.push({
                id: subject.sub_id,
                name: subject.sub_name,
                desc: subject.sub_desc,
                crs_and_yr: `${subject.course} - ${subject.year_level}`
            });

            console.log(`Match Added: "${subject.sub_name}"`);
        } else if (isMatchWithSpaces || isMatchWithoutSpaces) {
            console.log(`Duplicate Match Ignored: "${subject.sub_name}"`);
        } else {
            console.log(`No match for "${subject.sub_name}" in OCR Text`);
        }
    });

    console.log('Matched Subjects:', matchedSubjects);
    return matchedSubjects;
}


function extractCourseAndYear(ocrText) {
    const courseYearRegex = /Course\s*&\s*Year\s*:\s*([A-Za-z]+)-([1-4])/i;
    
    const match = ocrText.match(courseYearRegex);

    let result = {
        course: null,
        year: null
    };

    if (match) {
        result.course = match[1].toUpperCase(); 
        result.year = match[2];                
    }

    let finalResult = result.course+' - '+result.year;  
    
    return finalResult;
}
