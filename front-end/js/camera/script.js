// Get screen dimensions and ensure the camera starts in landscape mode
const width = window.screen.height; // Note: width is screen's height because device is rotated
const height = window.screen.width;

let processedImg;

var app = {

    // Constants for overlay dimensions
    OVERLAY_WIDTH_PERCENT: 0.75,  // 75% of the image width
    OVERLAY_HEIGHT_PERCENT: 0.9,   // 90% of the image height

    initialize: function() {
        this.bindEvents();
    },
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
        document.getElementById('proceedBtn').addEventListener('click', this.proceed.bind(this));
        document.getElementById('captureNewBtn').addEventListener('click', this.captureNew.bind(this));
    },
    onDeviceReady: function() {
        if (window.StatusBar) {
            StatusBar.hide();  // Hide the status bar
        }
        this.startCamera(); // Start the camera function

        // Bind the back button event
        document.addEventListener('backbutton', this.onBackButton.bind(this), false);
    },
    startCamera: function() {
        // Lock screen orientation to landscape
        screen.orientation.lock('landscape-primary').catch((error) => {
            console.error('Failed to lock orientation:', error);
        });

        // Start the camera preview with landscape dimensions
        CameraPreview.startCamera({
            x: 0, y: 0, width: width, height: height, 
            toBack: true, previewDrag: false, tapPhoto: false, tapFocus: true, camera: CameraPreview.CAMERA_DIRECTION.BACK
        });

        // Show overlay with rectangle
        var overlay = document.getElementById('overlay');
        overlay.style.width = (this.OVERLAY_WIDTH_PERCENT * 100) + '%';  // Set width based on constant
        overlay.style.height = (this.OVERLAY_HEIGHT_PERCENT * 100) + '%'; // Set height based on constant

        // Capture image when button is clicked
        document.getElementById('captureBtn').addEventListener('click', this.captureImage.bind(this)); // Bind context
    },
    captureImage: function() {
        // Capture image at 4K resolution (3840x2160)
        CameraPreview.takePicture({width: width, height: height, quality: 100}, (base64PictureData) => {
            var imgData = 'data:image/jpeg;base64,' + base64PictureData;
            this.cropImage(imgData);  // Call crop function
        });
    },
    cropImage: function(imageData) {
        var img = new Image();
        img.src = imageData;
    
        img.onload = () => {
            var canvas = document.createElement('canvas');
            var ctx = canvas.getContext('2d');
    
            // Get original image dimensions
            const originalWidth = img.width;
            const originalHeight = img.height;
    
            // Get the overlay rectangle's actual on-screen dimensions
            const overlayElement = document.getElementById('overlay');
            const overlayRect = overlayElement.getBoundingClientRect();
    
            // Calculate scale factor to convert overlay coordinates to image resolution
            const scaleX = originalWidth / width;
            const scaleY = originalHeight / height;
    
            // Calculate the exact crop area in the image based on the overlay rectangle
            const overlayX = overlayRect.left * scaleX;
            const overlayY = overlayRect.top * scaleY;
            const overlayWidth = overlayRect.width * scaleX;
            const overlayHeight = overlayRect.height * scaleY;
    
            // Set canvas size to match overlay dimensions for cropping
            canvas.width = overlayWidth;
            canvas.height = overlayHeight;
    
            // Crop the image to the overlay dimensions
            ctx.drawImage(
                img,
                overlayX, overlayY,                   // Start at overlay position
                overlayWidth, overlayHeight,          // Crop area size
                0, 0,                                 // Draw at the top-left of the canvas
                canvas.width, canvas.height           // Scale to canvas size
            );
    
            // Display cropped image in modal
            var croppedImage = canvas.toDataURL('image/jpeg');
            var resultImage = document.getElementById('result');
            resultImage.src = croppedImage;
            
            preprocessImage(croppedImage).then((prodataUrl) => {
                processedImg = prodataUrl;
                document.getElementById('loadingContainer').style.display = 'none';
                document.getElementById('resultModal').style.display = 'flex';
            }).catch((error) => {
                console.error("Error during image preprocessing:", error);
                window.location.replace('index.html');
            });
        };
    },  
    stopCamera: function() {
        CameraPreview.stopCamera();
        console.log('Camera stopped');

        // Check if the screen.orientation API is available
        if (screen.orientation && typeof screen.orientation.unlock === 'function') {
            // Attempt to unlock orientation
            const unlockPromise = screen.orientation.unlock();
            if (unlockPromise && typeof unlockPromise.then === 'function') {
                unlockPromise.then(() => {
                    console.log('Orientation unlocked');
                }).catch((error) => {
                    console.error('Failed to unlock orientation:', error);
                });
            } else {
                console.warn('Unlock method did not return a promise.');
            }
        } else {
            console.warn('Screen orientation API is not available or unlock method is not a function.');
        }
    },
    proceed: function(croppedImage) {
        //document.getElementById('resultModal').style.display = 'none'; // Hide the modal
        localStorage.setItem('proImageData', processedImg);
        localStorage.setItem('ImageData', croppedImage); // Store the image data in local storage
        this.stopCamera();
        window.location.href = "front-end/upload.html";
    },
    captureNew: function() {
        alert("Capturing a new image.");
        document.getElementById('resultModal').style.display = 'none'; // Hide modal and prepare to capture new image
        this.startCamera(); // Restart the camera if needed
    },
    onBackButton: function() {
        console.log('Stop rotating onbackbutton');
        this.stopCamera(); // Stop the camera when back button is pressed
        window.location.href="index.html"; // Navigate back to the previous page
    }
};

app.initialize();
