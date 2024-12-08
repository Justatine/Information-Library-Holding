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
            tessedit_pageseg_mode: Tesseract.PSM.SINGLE_COLUMN
        }
    ).then(async ({ data: { text } }) => {
        console.log('OCR Result:', text);
        sessionStorage.setItem('ocrResult', text);

        await logOcrResult(text);
        
        window.location.href = "front-end/subjects.html";
    }).catch(error => {
        console.error('Tesseract error:', error);
        alert('Tesseract error: ' + error);
        window.location.replace('../index.html');
    });
}

function logOcrResult(ocrResult) {
    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: url+"api-log/logs.php",
            data: {
                ocr_result: ocrResult
            },
            dataType: "json",
            success: function (response) {
                if(response.success){   
                    console.log(response.message);
                    resolve();
                }else{
                    console.error(response.message);
                    resolve();
                }
            },
            error: function(xhr, status, error) {
                //console.error('Error logging OCR result:', xhr.responseText, error);
                reject(error);  // Reject if there’s an AJAX error
            }
        })
    });
}
