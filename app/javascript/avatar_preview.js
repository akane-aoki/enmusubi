// import jquery from "jquery"
// window.$ = jquery
function previewImage(event) {
    const target = event.target;
    const file = target.files[0];
    const reader  = new FileReader();
    reader.onloadend = function () {
        const preview = document.querySelector("#preview")
        if(preview) {
            preview.src = reader.result;
        }
    }
    if (file) {
        reader.readAsDataURL(file);
    }
}
$(document).on('change', '.js-preview-image', function(event){previewImage(event)})