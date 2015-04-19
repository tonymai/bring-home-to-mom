// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:change', function() {

  var modalSetting = {
    onOpen: function (dialog) {
      dialog.data.fadeIn('fast');
      dialog.container.fadeIn('fast');
      dialog.overlay.fadeIn('fast');
    },
    opacity: 85
  };

  $('.child-profiles-wrapper').on('click', '.child-profile-teaser', function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).find('a').attr('href'),
    }).done(function(data) {
      var source = $('#child-profile-template').html();
      var templatingFunction = Handlebars.compile(source);
      // $('.child-profiles-wrapper').append(templatingFunction(data));
      $(templatingFunction(data)).modal(modalSetting);
      $('#gallery-wrap').owlCarousel({
        navigation: true,
        slideSpeed: 300,
        paginationSpeed: 400,
        singleItem: true,
      });
    }).fail(function(data) {
      debugger
    });
  });

});

