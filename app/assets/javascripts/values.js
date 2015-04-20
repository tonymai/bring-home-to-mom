$(document).on('page:change', function() {
  $('.values-wrapper').on('click', '.value-btn', function(e){
    e.preventDefault();
    $(this).toggleClass('value-btn-selected')
  });

  // $('.new-pf-section').on('click', '.submit-ll', function(e){
  //   e.preventDefault();
  //   var selectedIds = getSelectedValueIds();
  //   var parentId = $('.new-values-container').attr('data-user-id');
  //   var childId = $('.new-values-container').attr('data-profile-id');
  //   $.ajax({
  //     url: '/users/'+parentId+'/profiles/'+childId,
  //     type: 'PUT',
  //     data: { values: selectedIds },
  //     dataType: 'JSON',
  //   }).done(function (data) {
  //     window.location.href ="/"
  //     // Hides value container and shows button to complete full child profile
  //     // $('.new-values-container').hide();
  //     // $('.complete-child-profile').show();
  //   });
  // });
});

function getSelectedValueIds() {
  var selectedIds = [];
  var $values = $('.value-btn-selected');
  $.each($values, function(index, value){
    selectedIds.push($(value).attr('data-value-id'));
  })
  return selectedIds;
}
