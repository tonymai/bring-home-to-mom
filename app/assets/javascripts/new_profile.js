$(document).on('page:change', function() {
  $('#new_child').on('submit', function(){

    $('#new_child').ajaxSubmit({
      success: function(response) {
        console.log('success');
        console.log(response);
      },
      error: function(response) {
        $('.error-explanation').show();
        $('.error-messages').empty();

        $.each(response.responseJSON.errors, function(index, error) {
          $('.error-messages').append('<li>' + error + '</li>')
        })
      }
    });
    return false; //prevents default
  });
});
