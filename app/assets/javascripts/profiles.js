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
      $('.pf-bio-wrapper').on('click', function(event) {
        $('.bio-front').toggleClass('hidden');
        $('.bio-back').toggleClass('hidden')
      });
      $('.pf-interests-wrapper').on('click', function(event) {
        $('.interests-front').toggleClass('hidden');
        $('.interests-back').toggleClass('hidden')
      });
      $('.pf-values-wrapper').on('click', function(event) {
        $('.values-front').toggleClass('hidden');
        $('.values-back').toggleClass('hidden')
      });
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

  $('.matches').on('click', '.individual-child', function(e) {
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

Handlebars.registerHelper('ifCond', function(v1, v2, options) {
  if(v1 === v2) {
    return options.fn(this);
  }
  return options.inverse(this);
});
