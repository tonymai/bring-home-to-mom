$(document).on('page:change', function(){

	$('.new-pf-section h2').on('click', function(e) {
		e.preventDefault();
		var $thisContainer = $(this).parent().next()
		$('.new-pf-container').not($thisContainer).slideUp('slow', function() {});
		$thisContainer.slideDown('slow', function() {});
	});

  $('input[type="file"]').change(function(e){
     var input = $(e.currentTarget);
     var file = input[0].files[0];
     var reader = new FileReader();
     var preview = $(this).next().next()
     reader.onload = function(e){
         image_base64 = e.target.result;
         preview.attr("src", image_base64);
     };
     reader.readAsDataURL(file);
  });

});