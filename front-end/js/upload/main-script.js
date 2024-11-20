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

document.addEventListener('DOMContentLoaded', function () {
    const proImageData = localStorage.getItem('proImageData');
    performOCR(proImageData);
});
