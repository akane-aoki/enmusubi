import jquery from "jquery"
window.$ = jquery

// function previewFileWithId(img_prev) {
//   const target = this.event.target;
//   const file = target.files[0];
//   const reader  = new FileReader();
//   reader.onloadend = function () {
//     img_prev.src = reader.result;
//   }
//   if (file) {
//     reader.readAsDataURL(file);
//   } else {
//     img_prev.src = '';
//   }
// }
{/* <script type="text/javascript"> */}
$(function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#board_img").change(function(){
      readURL(this);
  });
});
// </script>