$(document).on('page:change', function() {

  $('.new-pf-section h2').on('click', function(e) {
    e.preventDefault();
    var $thisContainer = $(this).parent().next()
    $('.new-pf-container').not($thisContainer).slideUp('slow', function() {});
    $thisContainer.slideDown('slow', function() {});
  });

  $('.new-pf-section .continue').on('click', function(e) {
    e.preventDefault();
    var $thisContainer = $(this).parent().parent()
    var $nextContainer = $thisContainer.parent().next().children('.new-pf-container')
    $('.new-pf-container').slideUp('slow', function() {});
    $nextContainer.slideDown('slow', function() {});
  });

  $('.new-pf-section .continue-force').on('click', function(e) {
    e.preventDefault();
    var $thisContainer = $(this).parent().parent().parent();
    var $nextContainer = $thisContainer.parent().next().children('.new-pf-container');
    $('.new-pf-container').slideUp('slow', function() {});
    $nextContainer.slideDown('slow', function() {});
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

  $('#new_child').on('submit', function(){
    var $thisForm = $(this);
    var $nextContainer = $(this).next().children('.new-pf-container');
    $('#new_child').ajaxSubmit({
      success: function(response) {
        // $('.new-pf-form-container').empty();
        $('.child-name').text(response.first_name);
        // $('.new-interests-container').show();
        // $('.new-values-container').show();
        $thisForm.find('input[type="submit"]').hide();
        $thisForm.find('a.hidden').show();
        $('.new-interests-container').attr('data-profile-id', response.id);
        $('.new-interests-container').attr('data-user-id', response.parent_id);
        $('.new-values-container').attr('data-profile-id', response.id);
        $('.new-values-container').attr('data-user-id', response.parent_id);
        $('.profile-error-messages').empty();
        //move to next section
        $('.new-pf-container').slideUp('slow', function() {});
        $nextContainer.slideDown('slow', function() {});
      },
      error: function(response) {
        $('.profile-error-explanation').show();
        $('.profile-error-messages').empty();
        $.each(response.responseJSON.errors, function(index, error) {
          $('.profile-error-messages').append('<li>' + error + '</li>')
        })
      }
    });
    return false; //prevents default
  });
});
