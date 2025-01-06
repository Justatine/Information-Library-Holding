function preloadTesseract() {
    return new Promise((resolve, reject) => {
        // Add your Tesseract preloading code here
        console.log("Tesseract is preloading...");

        const dummyImageUrl = 'front-end/css/img/crop.png';  // Change this to your actual image path

        // Perform a dummy OCR to preload resources
        Tesseract.recognize(
            dummyImageUrl,  // This should be a valid URL to your image
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
