async function preprocessImage(imgSrc) {
    const progressBar = document.getElementById('progressBar');
    progressBar.value = 0;

    const img = new Image();
    img.src = imgSrc;

    document.getElementById('loadingContainer').style.display = 'flex';

    return new Promise((resolve, reject) => {
        img.onload = async () => {
            try {
                // Create a canvas to draw the image and retrieve its pixel data
                const canvas = document.createElement('canvas');
                canvas.width = img.width;
                canvas.height = img.height;
                const ctx = canvas.getContext('2d');
                ctx.drawImage(img, 0, 0);

                // Create a Mat object from the canvas
                let src = cv.imread(canvas);

                // Get original image dimensions
                let width = src.cols;
                let height = src.rows;

                const maxWidth = 7680;  // Max width for 8K
                const maxHeight = 4320;  // Max height for 8K

                // Resize to 4x of original size
                let newWidth = width * 5;
                let newHeight = height * 5;

                // Check if resizing exceeds 8K dimensions and adjust if necessary
                if (newWidth > maxWidth || newHeight > maxHeight) {
                    const scaleFactor = Math.min(maxWidth / width, maxHeight / height);
                    newWidth = Math.floor(width * scaleFactor);
                    newHeight = Math.floor(height * scaleFactor);
                }

                console.log(`Resized image to dimensions: ${newWidth}x${newHeight}`);

                // Resize the image
                let resizedImage = new cv.Mat();
                cv.resize(src, resizedImage, new cv.Size(newWidth, newHeight), 0, 0, cv.INTER_LINEAR);
                updateProgress(11);

                await delay(50);

                // Convert to grayscale
                let grayImage = new cv.Mat();
                cv.cvtColor(resizedImage, grayImage, cv.COLOR_BGR2GRAY);
                updateProgress(22);
                await delay(50);

                // CLAHE (Contrast Limited Adaptive Histogram Equalization)
                let clahe = new cv.CLAHE(1.0, new cv.Size(60, 60));
                let claheImage = new cv.Mat();
                clahe.apply(grayImage, claheImage);
                updateProgress(33);
                await delay(50);

                // Apply Gaussian blur
                let blurredImage = new cv.Mat();
                cv.GaussianBlur(claheImage, blurredImage, new cv.Size(13, 13), 0);
                updateProgress(44);
                await delay(50);

                // Detect edges using Canny edge detection
                let edges = new cv.Mat();
                cv.Canny(blurredImage, edges, 200, 200);
                console.log('Canny edge detection complete');
                updateProgress(55);
                await delay(50);

                // Convert images to 3-channel format for blending
                let blurredImage_3ch = new cv.Mat();
                let edges_3ch = new cv.Mat();
                cv.cvtColor(blurredImage, blurredImage_3ch, cv.COLOR_GRAY2BGR);
                cv.cvtColor(edges, edges_3ch, cv.COLOR_GRAY2BGR);

                // Blend blurred image with edges to create a hybrid result
                let hybridResult = new cv.Mat();
                cv.addWeighted(blurredImage_3ch, 1, edges_3ch, 1, 0, hybridResult);

                let hybridGray = new cv.Mat();
                cv.cvtColor(hybridResult, hybridGray, cv.COLOR_BGR2GRAY);
                console.log('Hybrid filtering complete');
                updateProgress(66);
                await delay(50);

                // Adaptive thresholding (Gaussian)
                let adaptiveThresholded = new cv.Mat();
                cv.adaptiveThreshold(hybridGray, adaptiveThresholded, 255, cv.ADAPTIVE_THRESH_GAUSSIAN_C, cv.THRESH_BINARY, 11, 2);
                console.log('Adaptive filtering complete');
                updateProgress(77);
                await delay(50);

                // Morphological opening to reduce noise
                let kernel = cv.Mat.ones(7, 7, cv.CV_8U);
                let morphOpen = new cv.Mat();
                cv.morphologyEx(adaptiveThresholded, morphOpen, cv.MORPH_OPEN, kernel);
                console.log('Morphology complete');
                updateProgress(88);
                await delay(50);
                
                // Median blur to remove noise
                let blurred = new cv.Mat();
                cv.medianBlur(adaptiveThresholded, blurred, 11);
                console.log('Median blur complete');
                updateProgress(95);
                await delay(50);

                // Crop the image to 65% of its width
                let cropWidth = Math.floor(blurred.cols * 0.65);
                let cropped = blurred.roi(new cv.Rect(0, 0, blurred.cols - cropWidth, blurred.rows));
                console.log('Cropping complete');
                updateProgress(99);

                // Convert the processed cropped image to a Data URL for display
                const processedCanvas = document.createElement('canvas');
                processedCanvas.width = cropped.cols;
                processedCanvas.height = cropped.rows;
                cv.imshow(processedCanvas, cropped);

                const dataUrl = processedCanvas.toDataURL();

                // Resolve the promise with the data URL
                resolve(dataUrl);
                console.log(resizedImage);

                // Cleanup
                kernel.delete();
                resizedImage.delete();
                grayImage.delete();
                claheImage.delete();
                blurredImage.delete();
                edges.delete();
                blurredImage_3ch.delete();
                edges_3ch.delete();
                hybridResult.delete();
                hybridGray.delete();
                adaptiveThresholded.delete();
            } catch (error) {
                console.error("Error during image preprocessing:", error);
                alert("Error during image preprocessing:", error);
                window.location.replace('index.html');
                reject(error);
            }
        };

        img.onerror = (error) => {
            console.error("Failed to load the image. Please ensure the base64 string is valid and includes the correct prefix (e.g., data:image/jpeg;base64,).", error);
            alert(error); // Reject the promise if image loading fails
        };
    });
}

function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function updateProgress(value) {
    const progressBar = document.getElementById('progressBar');
    progressBar.value = value;
}
