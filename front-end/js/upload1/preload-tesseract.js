function preloadTesseract() {
    return new Promise((resolve) => {
        console.log("Tesseract is preloading...");

        const dummyImageUrl = 'css/img/crop.png';

        Tesseract.recognize(
            dummyImageUrl,
            'eng',
            {
                logger: info => {
                    console.log(info);
                    if (info.status === 'recognizing text') {
                        const progress = Math.round(info.progress * 100);
                        console.log('progress var:' + progress);
                        updateProgress(progress);
                    }
                },
            }
        ).then(() => {
            document.getElementById('loadingContainer').style.display = 'none';
            console.log("Tesseract preloaded.");
            resolve();
        }).catch((error) => {
            console.log('Tesseract error: ' + error);
            alert('Tesseract error: ' + error);
            window.location.replace('../index.html');
            resolve();
        });
    });
}
