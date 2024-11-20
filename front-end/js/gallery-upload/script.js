document.addEventListener('deviceready', function() {
    // Hide the status bar when the device is ready
    if (window.StatusBar) {
        StatusBar.overlaysWebView(false); // Ensure the app overlays the status bar
    }
    console.log('Device is ready');

    // Add the event listener for the exit button here
    document.getElementById("exit-button").addEventListener("click", function(event) {
        event.preventDefault();  // Prevent any default behavior
        
        // Cordova App exit for Android
        if (navigator.app) {
            navigator.app.exitApp();
        } 
        // Alternatively, use the Cordova device API
        else if (navigator.device) {
            navigator.device.exitApp();
        } 
        // Fallback if the exit functionality is not available
        else {
            console.log("Exit functionality is only available on Android in Cordova.");
        }
    });

}, false);

$(document).ready(function() {

    var fileInputTriggered = false;

    // Handle the upload button click event
    $('#upload-btn').click(function() {
        if(!fileInputTriggered){
            $('#uploadInstructionsModal').modal('show');
            fileInputTriggered = true;
        }
    });

    // Handle "Got It" button click
    $('#got-it-btn').click(function() {
        if (fileInputTriggered) {
            // Trigger the file input to select the file after modal confirmation
            $('#fileInput').click();
            fileInputTriggered = false;
        }
    });

    $(document).ready(function() {
        console.log("Document is ready.");

        // Retrieve the image data from localStorage
        const imageData = localStorage.getItem('imageData');
        console.log(imageData);

        if (imageData) {
            preprocess(imageData);
        } else {
            console.warn("No image data found in localStorage.");
        }

        // Event listener for the 'proceed' button
        $('#proceedBtn').on('click', function() {
            alert("Proceeding with the current image.");
            window.location.href = "gallery-upload.html"; // Update with your actual next page URL
        });

        // Event listener for 'take another picture' button
        $('#takeCameraAgainBtn').on('click', function() {
            alert("Taking a new picture.");
            localStorage.removeItem('imageData');
            window.location.replace("../camera.html"); // Adjust the path as needed
        });
    });

});