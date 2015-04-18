// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:change', function() {

  $('.interests-wrapper').on('click', '.interest-btn', function(e){
    e.preventDefault();
    $(this).toggleClass('interest-btn-selected')
  })

  $('#new_interest').on('submit', function(e){
    e.preventDefault();

    var interest = $('#interest_name').val();
    var childId = $('.new-interests-container').attr('data-profile-id');

    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      dataType: 'JSON',
      data: { interest: {name: interest}, child_id: childId }
    }).done(function(data) {
      $('#new_interest')[0].reset();
      $('.interests-wrapper').append('<div class="interest-btn interest-btn-selected" data-interest-id="' + data.interest.id + '">' + data.interest.name + '</div>');
    }).fail(function(errors) {

    });
  });

  $('.new-interests-container').on('click', '.submit-interests', function(e){
    e.preventDefault();
    var selectedIds = getSelectedInterestIds();
    var parentId = $('.new-interests-container').attr('data-user-id');
    var childId = $('.new-interests-container').attr('data-profile-id');
    $.ajax({
      url: '/users/'+parentId+'/profiles/'+childId,
      type: 'PUT',
      data: { interests: selectedIds },
      dataType: 'JSON',
    }).done(function (data) {
      $('.new-interests-container').hide();
      $('.complete-child-profile').show();
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
