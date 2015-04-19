// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:change', function() {

  var modalSetting = {
    onOpen: function (dialog) {
      dialog.data.fadeIn('fast');
      dialog.container.fadeIn('fast');
      dialog.overlay.fadeIn('fast');
    },
    onShow: function(dialog) {

    },
    onClose: function(dialog) {
      dialog.data.fadeOut('fast');
      dialog.container.fadeOut('fast');
      dialog.overlay.fadeOut('fast');
    },
    opacity: 85,
    overlayClose: true,
    show: true
  };

  $('.child-profiles-wrapper').on('click', '.child-profile-teaser', function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).find('a').attr('href'),
    }).done(function(data) {
      var source = $('#child-profile-template').html();
      var templatingFunction = Handlebars.compile(source);
      var html = templatingFunction(data);
      $('.pf-modal-container').remove();
      $('body').append(html);
      $('.pf-modal-container').modal(modalSetting);
    }).fail(function(data) {
      debugger
    });
  });

});

