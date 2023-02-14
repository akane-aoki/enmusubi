console.log('a')

function previewFileWithId(id) {
  console.log('bbb');
  const target = this.event.target;
  const file = target.files[0];
  const reader  = new FileReader();
  reader.onloadend = function () {
      img_prev.src = reader.result;
  }
  if (file) {
      reader.readAsDataURL(file);
  } else {
      img_prev.src = '';
  }
}