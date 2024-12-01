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
    console.log('Processed OCR Text:', processedOcrText);  // Debug: Show the processed OCR text

    subjects.forEach(subject => {
        // Clean the subject name by converting to lowercase and removing spaces
        const subjectNameWithSpace = subject.sub_name ? subject.sub_name.toLowerCase() : '';
        const subjectNameWithoutSpace = subjectNameWithSpace.replace(/\s+/g, ''); 

        // Check if the subject with spaces matches the OCR text
        const regexWithSpaces = new RegExp(`\\b${subjectNameWithSpace}\\b`, 'i');

        // Check if the subject name with spaces exists in the OCR text
        const isMatchWithSpaces = regexWithSpaces.test(processedOcrText);

        // If the subject with spaces matches, add it to matchedSubjects
        if (isMatchWithSpaces) {
            console.log('piste with spaces')

            console.log(`Match Found (with spaces): "${subjectNameWithSpace}" is found in OCR Text!`);
            matchedSubjects.push({
                id: subject.sub_id,
                name: subject.sub_name,
                desc: subject.sub_desc,
                crs_and_yr: subject.course+' - '+subject.year_level
            });
        } else {
            // If no match with spaces, check for subject without spaces
            const regexWithoutSpaces = new RegExp(`\\b${subjectNameWithoutSpace}\\b`, 'i');
            console.log('Generated Regex without Spaces:', regexWithoutSpaces);  // Debug: Show the regex pattern without spaces

            const isMatchWithoutSpaces = regexWithoutSpaces.test(processedOcrText);
            console.log(`Matching "${subjectNameWithoutSpace}" (without spaces) in OCR Text: ${isMatchWithoutSpaces}`);  // Debug: Log if the subject without spaces matches

            if (isMatchWithoutSpaces) {
                console.log('piste no spaces')
                console.log(`Match Found (without spaces): "${subjectNameWithoutSpace}" is found in OCR Text!`);  // Debug: Log if match is found
                matchedSubjects.push({
                    id: subject.sub_id,
                    name: subject.sub_name,
                    desc: subject.sub_desc,
                    crs_and_yr: subject.course+' - '+subject.year_level
                });
            } else {
                console.log(`No match for "${subject.sub_name}" (with or without spaces) in OCR Text`); // Debug: Log if no match found
            }
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
