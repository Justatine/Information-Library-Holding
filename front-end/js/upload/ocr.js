// Function to perform OCR using Tesseract.js
async function performOCR(imageDataUrl) {
    console.log('Start OCR');

    const progressBar = document.getElementById('progressBar');
    progressBar.value = 0;

    document.getElementById('loadingContainer').style.display = 'flex';

    // Pass the base64 image data to Tesseract.js for OCR
    Tesseract.recognize(
        imageDataUrl, 
        'eng',      
        {
            logger: info => {
                console.log(info);
                if (info.status === 'recognizing text') {
                    const progress = Math.round(info.progress * 100);
                    console.log('OCR progress:', progress);
                    updateProgress(progress);
                }
            },
            tessedit_pageseg_mode: Tesseract.PSM.AUTO
        }
    ).then(async ({ data: { text } }) => {
        console.log('OCR Result:', text);
        sessionStorage.setItem('ocrResult', text);

        // Ensure logOcrResult completes before proceeding
        await logOcrResult(text);
        
        // Code here will only execute after logOcrResult completes
        //console.log("OCR logging completed, continuing to the next step.");
        window.location.href = "subjects.html";
    }).catch(error => {
        console.error('Tesseract error:', error);
    });
}

// Function to send the OCR result to the PHP API using jQuery AJAX
function logOcrResult(ocrResult) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: 'https://ilibrary.zreky.muccs.host/back-end/api-log/v1/ocr_log',
            type: 'POST',
            data: { ocr_result: ocrResult },
            success: function(response) {
                console.log('Server Response:', response);
                if (response.msg === 'OCR result logged successfully') {
                    //console.log('OCR result successfully logged to database');
                    resolve();
                } else {
                    console.error('Failed to log OCR result:', response);
                    resolve();  // Resolve even if there's a server error to continue the flow
                }
            },
            error: function(xhr, status, error) {
                //console.error('Error logging OCR result:', xhr.responseText, error);
                reject(error);  // Reject if there’s an AJAX error
            }
        });
    });
}

function updateProgress(value) {
    const progressBar = document.getElementById('progressBar');
    progressBar.value = value;
}
