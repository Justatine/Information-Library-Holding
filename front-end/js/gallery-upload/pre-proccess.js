// Function to read the image file as a Data URL
function readImageAsDataURL(file) {
    return new Promise((resolve) => {
        const reader = new FileReader();
        reader.onload = function(e) {
            resolve(e.target.result);
        };
        reader.readAsDataURL(file);
    });
}

async function preprocess(imgSrc) {
    const progressBar = document.getElementById('progressBar');
    progressBar.value = 0;

    // Show loading screen and initialize progress
    document.getElementById('loadingContainer').style.display = 'flex';
    updateProgress(5);
    await delay(50);

    // Load image onto a temporary canvas
    const img = new Image();
    img.src = imgSrc;
    await new Promise(resolve => img.onload = resolve); // Wait for the image to load
    updateProgress(10);
    await delay(50);

    const canvas = document.createElement('canvas');
    const ctx = canvas.getContext('2d');
    
    // Resize image to double its original dimensions
    canvas.width = img.width * 2;
    canvas.height = img.height * 2;
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
    let src = cv.imread(canvas);
    updateProgress(15);
    await delay(50);

    // Convert to grayscale
    let gray = new cv.Mat();
    cv.cvtColor(src, gray, cv.COLOR_RGBA2GRAY);
    updateProgress(20);
    await delay(50);

    // Apply CLAHE (Contrast Limited Adaptive Histogram Equalization)
    let clahe = new cv.CLAHE(2.0, new cv.Size(8, 8));
    let claheImage = new cv.Mat();
    clahe.apply(gray, claheImage);
    updateProgress(25);
    await delay(50);

    // Apply Gaussian Blur
    let blurred = new cv.Mat();
    cv.GaussianBlur(claheImage, blurred, new cv.Size(3, 3), 0);
    updateProgress(30);
    await delay(50);

    // Apply adaptive thresholding
    let binary = new cv.Mat();
    cv.adaptiveThreshold(blurred, binary, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY, 15, 5);
    updateProgress(35);

    // Count black pixels
    let blackPixelCount = countBlackPixels(binary);
    console.log(`Number of black pixels: ${blackPixelCount}`);

    // Morphological operations
    let kernel = cv.Mat.ones(2, 2, cv.CV_8U);
    let morphOpen = new cv.Mat();
    cv.morphologyEx(binary, morphOpen, cv.MORPH_OPEN, kernel);
    let morphClose = new cv.Mat();
    cv.morphologyEx(morphOpen, morphClose, cv.MORPH_CLOSE, kernel);
    updateProgress(40);
    await delay(50);

    // Dilation for further enhancement
    let dilated = new cv.Mat();
    cv.dilate(morphClose, dilated, kernel);
    updateProgress(42);
    await delay(50);

    // Apply Median Blur
    let smoothed = new cv.Mat();
    cv.medianBlur(dilated, smoothed, 5);
    updateProgress(45);
    await delay(50);

    // Crop 40% from the right side
    const cropAmount = Math.floor(smoothed.cols * 0.65);
    const cropped = smoothed.roi(new cv.Rect(0, 0, smoothed.cols - cropAmount, smoothed.rows));
    updateProgress(50);

    // Convert the processed cropped image to a Data URL for display
    // const processedCanvas = document.createElement('canvas');
    // processedCanvas.width = cropped.cols;
    // processedCanvas.height = cropped.rows;
    // cv.imshow(processedCanvas, cropped); // Draw the cropped image onto the new canvas

    // const dataUrl = processedCanvas.toDataURL(); // Get the Data URL of the cropped image

    // // // Set the src of the processed image element to the Data URL and display it
    // const processedImageElement = document.getElementById('processedImage');
    // processedImageElement.src = dataUrl; // Set the image source
    // processedImageElement.style.display = 'block'; // Show the processed image

    // Convert the processed image to a Data URL for OCR
    const dataUrl = canvas.toDataURL(); // This should point to the cropped image, if needed
    performOCR(dataUrl); // Call performOCR with the Data URL of the processed image

    // Clean up memory
    src.delete(); claheImage.delete(); blurred.delete();
    binary.delete(); morphOpen.delete(); morphClose.delete();
    dilated.delete(); smoothed.delete(); cropped.delete(); kernel.delete();
}

function countBlackPixels(binary) {
    let blackPixelCount = 0;
    for (let i = 0; i < binary.rows; i++) {
        for (let j = 0; j < binary.cols; j++) {
            // Since we are working with a binary image, black pixels are represented by 0
            if (binary.ucharPtr(i, j)[0] === 0) {
                blackPixelCount++;
            }
        }
    }
    return blackPixelCount;
}

function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function updateProgress(value) {
    const progressBar = document.getElementById('progressBar');
    progressBar.value = value;
}