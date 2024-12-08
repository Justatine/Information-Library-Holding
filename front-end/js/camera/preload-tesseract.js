function preloadTesseract(capturedImageUrl) {
    return new Promise((resolve, reject) => {
        // Add your Tesseract preloading code here
        console.log("Tesseract is preloading...");

        // const dummyImageUrl = 'front-end/css/img/crop.png';  // Removed dummy image URL

        // Perform a dummy OCR to preload resources
        Tesseract.recognize(
            capturedImageUrl,  // Use the captured image URL
            'eng',
            {}
        ).then((result) => {
            console.log('Tesseract preloaded successfully:', result);
            resolve();  // Resolve the promise once Tesseract finishes successfully
        }).catch((error) => {
            console.log('Tesseract error: ' + error);
            alert('Tesseract error: ' + error);
            window.location.replace('index.html');  // Redirect to index page on error
            reject(error);  // Reject the promise if an error occurs
        });

        console.log("Tesseract preloaded.");
    });
}
