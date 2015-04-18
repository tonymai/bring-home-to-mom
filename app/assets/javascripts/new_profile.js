$(document).on('page:change', function() {
  $('#new_child').on('submit', function(event){
    event.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      dataType: 'JSON',
      data: $(this).serialize()

    }).done(function(response) {
      console.log('success');

    }).fail(function(response) {
      console.log('fail');
    });
  });
});
