document.addEventListener('deviceready', function() {
    // Hide the status bar when the device is ready
    if (window.StatusBar) {
        StatusBar.overlaysWebView(false); // Ensure the app overlays the status bar
    }
    console.log('Device is ready'); // Debugging log to confirm device readiness
    
}, false);

$(document).ready(function() {

        // Show the loading container
        document.getElementById('loadingContainer').style.display = 'flex';

        preloadTesseract();

        var fileInputTriggered = false;

        // Handle the upload button click event
        $('#upload-btn').click(function(e) {
            if(!fileInputTriggered){
                $('#uploadInstructionsModal').modal('show');
                fileInputTriggered = true;
            }
        });

        // Handle "Got It" button click
        $('#got-it-btn').click(function() {
            if (fileInputTriggered) {
                $('#fileInput').click();
            }
        });

        let proImage;

        $('#fileInput').change(async function(event) {
            fileInputTriggered = false;

            const file = event.target.files[0];
            if (!file) {
                // PART OF TESTING
                displayError('Please select an image to upload.');
                return;
            }
        
            const validTypes = ['image/jpeg', 'image/png', 'image/jpg'];
            if (!validTypes.includes(file.type)) {
                // PART OF TESTING
                displayError('Invalid file format. Please upload a JPG or PNG image.');
                return;
            }

            // Load and preprocess the image
            const imgSrc = await readImageAsDataURL(file);

            preprocessImage(imgSrc).then((prodataUrl) => {

                document.getElementById('loadingContainer').style.display = 'none';
                // Set the image source to the modal's image element
                $('#resultImage').attr('src', imgSrc);
                proImage = prodataUrl;
                $('#imageDisplayModal').modal('show');
            });
        });

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

        // Handle "Proceed" button click
        $('#proceedBtn').click(function() {
            // Close the modal
            $('#imageDisplayModal').modal('hide');
            performOCR(proImage);
        });

        // Handle "Cancel" button click
        $('#takeCameraAgainBtn').click(function() {
            // Just close the modal without any further actions
            $('#imageDisplayModal').modal('hide');
        });
});