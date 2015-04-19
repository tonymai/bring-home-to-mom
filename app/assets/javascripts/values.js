$(document).on('page:change', function() {
  $('.values-wrapper').on('click', '.value-btn', function(e){
    e.preventDefault();
    $(this).toggleClass('value-btn-selected')
  })
});
