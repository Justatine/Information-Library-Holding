async function preprocessImage(imgSrc) {
    const progressBar = document.getElementById('progressBar');
    if (progressBar) progressBar.value = 0;

    const img = new Image();
    img.src = imgSrc;

    const loadingContainer = document.getElementById('loadingContainer');
    if (loadingContainer) loadingContainer.style.display = 'flex';

    return new Promise((resolve, reject) => {
        img.onload = async () => {
            try {
                // Create a canvas to process the image
                const canvas = document.createElement('canvas');
                canvas.width = img.width;
                canvas.height = img.height;
                const ctx = canvas.getContext('2d');

                if (!ctx) {
                    throw new Error("Canvas context is unavailable. Please check your environment.");
                }

                ctx.drawImage(img, 0, 0);

                let src = cv.imread(canvas);

                // Get dimensions and resize to ensure compatibility
                const maxWidth = 7680;
                const maxHeight = 4320;
                let resizedImage = resizeImage(src, maxWidth, maxHeight);
                downloadImage(resizedImage, 'resizedImage.png');
                updateProgress(20);
                await delay(50);

                // Convert to grayscale
                let grayImage = new cv.Mat();
                cv.cvtColor(resizedImage, grayImage, cv.COLOR_BGR2GRAY);
                downloadImage(grayImage, 'grayImage.png');
                updateProgress(40);
                await delay(50);

                // Increase contrast (normalize the image)
                let contrastImage = new cv.Mat();
                cv.normalize(grayImage, contrastImage, 0, 255, cv.NORM_MINMAX);
                updateProgress(50);
                await delay(50);

                // Apply Otsu's Thresholding
                let otsuThresholded = new cv.Mat();
                cv.threshold(contrastImage, otsuThresholded, 0, 255, cv.THRESH_BINARY + cv.THRESH_OTSU);
                downloadImage(otsuThresholded, 'otsuThresholded.png');
                updateProgress(60);
                await delay(50);

                // Apply Gaussian blur for noise reduction
                let blurred = new cv.Mat();
                cv.GaussianBlur(otsuThresholded, blurred, new cv.Size(5, 5), 0);
                downloadImage(blurred, 'blurredImage.png');
                updateProgress(70);
                await delay(50);

                // Morphological operations: Dilation to make text thicker
                let kernel = cv.Mat.ones(3, 3, cv.CV_8U); // Use a 3x3 kernel for dilation
                let dilated = new cv.Mat();
                cv.dilate(blurred, dilated, kernel);
                downloadImage(dilated, 'dilatedImage.png');
                updateProgress(80);
                await delay(50);

                // Crop to a larger region if necessary (optional)
                const cropWidth = Math.floor(dilated.cols * 0.25);
                const cropped = dilated.roi(new cv.Rect(0, 0, dilated.cols - cropWidth, dilated.rows));
                downloadImage(cropped, 'croppedImage.png');
                updateProgress(90);
                await delay(50);

                // Convert to Data URL for Cordova compatibility
                const outputCanvas = document.createElement('canvas');
                outputCanvas.width = cropped.cols;
                outputCanvas.height = cropped.rows;
                cv.imshow(outputCanvas, cropped);

                const dataUrl = outputCanvas.toDataURL();

                // Cleanup OpenCV objects
                src.delete();
                resizedImage.delete();
                grayImage.delete();
                contrastImage.delete();
                otsuThresholded.delete();
                blurred.delete();
                kernel.delete();
                dilated.delete();

                resolve(dataUrl);
            } catch (error) {
                console.error("Error during image preprocessing:", error);
                reject(error);
            } finally {
                if (loadingContainer) loadingContainer.style.display = 'none';
            }
        };

        img.onerror = (error) => {
            console.error("Failed to load the image. Ensure the image source is correct.", error);
            reject(error);
        };
    });
}

function resizeImage(src, maxWidth, maxHeight) {
    const scaleFactor = Math.min(maxWidth / src.cols, maxHeight / src.rows);
    const newWidth = Math.floor(src.cols * scaleFactor);
    const newHeight = Math.floor(src.rows * scaleFactor);

    let resizedImage = new cv.Mat();
    cv.resize(src, resizedImage, new cv.Size(newWidth, newHeight), 0, 0, cv.INTER_LINEAR);
    return resizedImage;
}

function delay(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}

function updateProgress(value) {
    const progressBar = document.getElementById('progressBar');
    if (progressBar) progressBar.value = value;
}

function downloadImage(mat, filename) {
    const canvas = document.createElement('canvas');
    canvas.width = mat.cols;
    canvas.height = mat.rows;
    cv.imshow(canvas, mat);
    canvas.toBlob((blob) => {
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = filename;
        link.click();
    });
}
