$(document).on('page:change', function() {
  $('#new_child').on('submit', function(){

    $('#new_child').ajaxSubmit({
      success: function(response) {
        console.log('success');
        console.log(response);
      },
      error: function(response) {
        console.log('fail');
        console.log(response.responseJSON);
      }
    });
    return false; //prevents default
  });
});
