// Function to request camera access
async function requestCameraAccess() {
    try {
        const stream = await navigator.mediaDevices.getUserMedia({ video: true });
        console.log("Camera access granted");
        
        const videoElement = document.getElementById('videoElement');
        videoElement.srcObject = stream;
        videoElement.play();
        
        // Store the stream and track for later use
        window.currentStream = stream; // Store the stream globally
        window.currentTrack = stream.getVideoTracks()[0]; // Store the track globally

        // Ensure the capture button is available before adding the event listener
        const captureButton = document.getElementById('captureButton'); // Ensure you have a button with this ID in your HTML
        if (captureButton) {
            captureButton.addEventListener('click', async () => {
                const imageCapture = new ImageCapture(window.currentTrack);
                const photoBlob = await imageCapture.takePhoto(); // Capture the image
                
                const photoURL = URL.createObjectURL(photoBlob);
                const imgElement = document.getElementById('capturedImage');
                imgElement.src = photoURL;
                imgElement.style.display = 'block';
                
                videoElement.style.display = 'none';
                window.currentStream.getTracks().forEach(track => track.stop());
                console.log("Image captured and displayed: ", photoURL);
                preloadTesseract(photoURL)

                const imgSrc = await readImageAsDataURL(photoBlob);
                if (imgSrc) {
                    preprocessImage(imgSrc).then((prodataUrl) => {
                        console.log("Image preprocessing completed.");
                        document.getElementById('loadingContainer').style.display = 'none';
                        // Set the image source to the modal's image element
                        // $('#resultImage').attr('src', imgSrc);
                        // proImage = prodataUrl;
                        console.log("Processed image data URL: ", prodataUrl);
                        // $('#imageDisplayModal').modal('show');

                        // Execute the performOCR function after preprocessing
                        performOCR(prodataUrl);
                    });
                } else {
                    console.error("Failed to read image as data URL.");
                }
            });
        } else {
            console.error("Capture button not found in the DOM.");
        }
    } catch (error) {
        console.error("Error accessing the camera: ", error);
        alert("Camera access denied. Please allow camera access to use this feature.");
    }
}

// Call the function when the page loads
window.onload = requestCameraAccess;

function readImageAsDataURL(file) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        
        reader.onload = function(event) {
            resolve(event.target.result); // Base64 encoded string
        };
        
        reader.onerror = function(error) {
            reject(error);
        };
        
        reader.readAsDataURL(file);
    });
}