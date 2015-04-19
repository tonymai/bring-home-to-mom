$(document).on('page:change', function() {
  $('#new_child').on('submit', function(){

    $('#new_child').ajaxSubmit({
      success: function(response) {
        $('.new-pf-form-container').empty();
        $('.child-name').text(response.first_name);
        $('.new-interests-container').show();
        $('.new-interests-container').attr('data-profile-id', response.id);
        $('.new-interests-container').attr('data-user-id', response.parent_id);
      },
      error: function(response) {
        $('.profile-error-explanation').show();
        $('.profile-error-messages').empty();
        $.each(response.responseJSON.errors, function(index, error) {
          $('.error-messages').append('<li>' + error + '</li>')
        })
      }
    });
    return false; //prevents default
  });
});
