// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('page:change', function() {

  $('.interests-wrapper').on('click', '.interest-btn', function(e){
    e.preventDefault();
    $(this).toggleClass('interest-btn-selected')
  });

  $('.new-pf-section h2').on('click', function(e) {
    e.preventDefault();
    var $thisContainer = $(this).parent().next()
    $('.new-pf-container').not($thisContainer).slideUp('slow', function() {});
    $thisContainer.slideDown('slow', function() {});
  });

  $('#new_interest').on('submit', function(e){
    e.preventDefault();
    $('.interest-error-explanation').hide();
    var interest = $('#interest_name').val();
    var childId = $('.new-interests-container').attr('data-profile-id');
    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      dataType: 'JSON',
      data: { interest: {name: interest}, child_id: childId }
    }).done(function(data) {
      $('#new_interest')[0].reset();
      if ($('[data-interest-id='+ data.interest.id +']').length === 0) {
        $('.interests-wrapper').append('<div class="interest-btn interest-btn-selected" data-interest-id="' + data.interest.id + '">' + data.interest.name + '</div>');
      } else {
        $('[data-interest-id='+ data.interest.id +']').addClass('interest-btn-selected');
      }
    }).fail(function(data) {
      $('.interest-error-explanation').show();
      $('.interest-error-messages').empty();
      $.each(data.responseJSON.errors, function(index, error) {
        $('.interest-error-messages').append('<li>' + error + '</li>')
      })
    });
  });

  $('.new-pf-section').on('click', '.submit-all', function(e){
    e.preventDefault();
    var selectedInterestIds = getSelectedInterestIds();
    var parentIdInterest = $('.new-interests-container').attr('data-user-id');
    var childIdInterest = $('.new-interests-container').attr('data-profile-id');
    $.ajax({
      url: '/users/'+parentIdInterest+'/profiles/'+childIdInterest,
      type: 'PUT',
      data: { interests: selectedInterestIds },
      dataType: 'JSON',
    }).done(function (data) {
      // window.location.href ="/"
      // Hides interest container and shows button to complete full child profile
      // $('.new-interests-container').hide();
      // $('.new-values-container').show();
    });
    var selectedValueIds = getSelectedValueIds();
    var parentIdValue = $('.new-values-container').attr('data-user-id');
    var childIdValue = $('.new-values-container').attr('data-profile-id');
    $.ajax({
      url: '/users/'+parentIdValue+'/profiles/'+childIdValue,
      type: 'PUT',
      data: { values: selectedValueIds },
      dataType: 'JSON',
    }).done(function (data) {
      window.location.href ="/"
      // Hides value container and shows button to complete full child profile
      // $('.new-values-container').hide();
      // $('.complete-child-profile').show();
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
