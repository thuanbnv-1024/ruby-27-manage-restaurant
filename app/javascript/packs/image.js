$(document).ready(function(){
  $(".image_fields").change(function(event) {
    validateFiles(this);
    preview_image(event);
  });
  function validateFiles(inputFile) {
    var extErrorMessage = I18n.t("image.image_type");
    var allowedExtension = ["jpg", "jpeg", "png", "gif"];

    var extName;
    var extError = false;

    $.each(inputFile.files, function() {
      extName = this.name.split('.').pop();
      if ($.inArray(extName, allowedExtension) == -1) {extError=true;};
    });
    if (extError) {
      window.alert(extErrorMessage);
      $(inputFile).val('');
    };
  }

  function preview_image(event) {
    var reader = new FileReader();
    reader.onload = function() {
      var output = document.getElementById("output_image");
      output.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
  }
})
