let worker;
let isTesseractInitialized = false;

let lastLoggedProgress = -1;

function logger(info) {
    console.log(info);
    if (info.status === 'recognizing text') {
        const progress = Math.round(info.progress * 50) + 50;
        if (progress !== lastLoggedProgress) { // Only log if progress has changed
            updateProgress(progress);
            lastLoggedProgress = progress; // Update the last logged progress
        }
    }
}

// Function to initialize Tesseract worker
async function initTesseractWorker() {
    try {
        worker = Tesseract.createWorker({
            logger: logger,
            workerPath: 'js/tesseract/worker.min.js',
            langPath: 'js/tesseract/tessdata/',
            corePath: 'js/tesseract/tesseract-core.wasm.js'
        });

        await worker.load();
        await worker.loadLanguage('eng');
        await worker.initialize('eng');

        isTesseractInitialized = true; // Set the flag to true
        console.log('Tesseract worker initialized successfully.');
    } catch (error) {
        console.error("Error initializing Tesseract worker:", error);
    }
}

// Call this function on page load
window.addEventListener('load', async () => {
    await initTesseractWorker(); // Ensure Tesseract is initialized
    document.getElementById('fileInput').disabled = false; // Enable input once initialized
});

// Function to update progress in the UI
function updateProgress(progress) {
    const progressBar = document.getElementById('progressBar');
    const progressText = document.getElementById('progressText');
    progressBar.value = progress;
    progressText.textContent = `Processing: ${progress}%`;
}

// Function to perform OCR using Tesseract.js
async function performOCR(imageDataUrl) {
    console.log('Start OCR');

    if (!isTesseractInitialized) {
        console.error('Tesseract is not initialized yet.');
        return; // Exit if not initialized
    }

    const { data: { text } } = await worker.recognize(imageDataUrl);
    console.log(text);
}

// Example usage when an image is uploaded
document.getElementById('fileInput').addEventListener('change', async (event) => {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = async (e) => {
            const imageDataUrl = e.target.result;
            await performOCR(imageDataUrl);
        };
        reader.readAsDataURL(file);
    }
});
