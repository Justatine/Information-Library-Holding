let worker;
let isTesseractInitialized = false;

// Logger function
function logger(info) {
    console.log(info);  // Log progress info
}

// Function to initialize Tesseract worker
async function initTesseractWorker() {
    try {
        worker = Tesseract.createWorker({
            logger: logger  // Pass the logger function
        });

        // Load Tesseract resources
        await worker.load();
        await worker.loadLanguage('eng');
        await worker.initialize('eng');

        isTesseractInitialized = true; // Set the flag to true
        console.log('Tesseract worker initialized successfully.');
    } catch (error) {
        console.error("Error initializing Tesseract worker:", error);
    }
}

// Call this function on page load or when you're ready
window.addEventListener('load', initTesseractWorker);

// Function to perform OCR using Tesseract.js
async function performOCR(imageDataUrl) {
    console.log('Start OCR');

    // Ensure Tesseract is initialized before recognizing
    if (!isTesseractInitialized) {
        console.error('Tesseract is not initialized yet.');
        return; // Exit if not initialized
    }

    // Pass the base64 image data to Tesseract.js for OCR
    const { data: { text } } = await worker.recognize(imageDataUrl);
    
    // Display the recognized text in the console
    console.log(text);
}
