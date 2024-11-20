let isTesseractPreloaded = false;

// Function to preload Tesseract using a real image
async function preloadTesseract() {
    try {
        // Use a real image from your project directory (update the path if necessary)
        const dummyImageUrl = 'css/img/crop.png';  // Change this to your actual image path

        // Perform a dummy OCR to preload resources
        await Tesseract.recognize(
            dummyImageUrl,  // This should be a valid URL to your image
            'eng',
            {}
        );

        isTesseractPreloaded = true; // Set the preloaded flag to true
        console.log('Tesseract preloaded successfully.');
        document.getElementById('loadingContainer1').style.display = 'none';
    } catch (error) {
        console.error("Error preloading Tesseract:", error);
    }
}

// Call preloadTesseract on page load or at the start of your application
window.addEventListener('load', preloadTesseract);

// Function to perform OCR using Tesseract.js
async function performOCR(imageDataUrl) {
    console.log('Start OCR');

    // Ensure Tesseract is preloaded before recognizing
    if (!isTesseractPreloaded) {
        console.error('Tesseract is not preloaded yet.');
        return; // Exit if not preloaded
    }

    // Pass the base64 image data to Tesseract.js for OCR
    Tesseract.recognize(
        imageDataUrl,  // The image data in base64 format
        'eng',         // Language for OCR (English)
        {
            logger: info => {
                console.log(info);
                if (info.status === 'recognizing text') {
                    const progress = Math.round(info.progress * 50) + 50; // Maps OCR progress from 50 to 100
                    console.log('progress var:' + progress);
                    updateProgress(progress);
                }
            },
            tessedit_pageseg_mode: Tesseract.PSM.SINGLE_COLUMN  // Set PSM to SINGLE_COLUMN
        }
    ).then(({ data: { text } }) => {
        // Display the recognized text in the console
        console.log(text);
        // You can uncomment the next line to display the text in a specific <p> element
        // document.getElementById('ocrResult').innerHTML = text;
    }).catch(error => {
        console.error('Tesseract error:', error);
    });
}
