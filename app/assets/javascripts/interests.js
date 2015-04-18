// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:change', function() {

  $('.interests-wrapper').on('click', '.interest-btn', function(e){
    e.preventDefault();
    $(this).toggleClass('interest-btn-selected')

    // debugger;
  })

  $('#new_interest').on('submit', function(e){
    e.preventDefault();
    debugger;
  })

  $('.new-interests-container').on('click', '.submit-interests', function(e){
    e.preventDefault();
    var selectedIds = getSelectedInterestIds();
    var parentId = $('.new-interests-container').attr('data-user-id');
    var childId = $('.new-interests-container').attr('data-profile-id');
    debugger;
    $.ajax({
      url: '/users/'+parentId+'/profiles/'+childId,
      type: 'PUT',
      data: {interests: selectedIds},
      dataType: 'JSON',
    }).done(function(data) {
      debugger;
    });
  });

});


function getSelectedInterestIds() {
  var selectedIds = [];
  var $interests = $('.interest-btn-selected');
  $.each($interests, function(index, interest){
    selectedIds.push($(interest).attr('data-interest-id'));
  })
  return selectedIds;
}
