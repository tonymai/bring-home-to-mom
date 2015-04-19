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
      $('.pf-modal-container').remove();
      $(templatingFunction(data)).modal(modalSetting);
      $('#gallery-wrap').slick({
        dots: true,
        infinite: true,
        speed: 500,
        initialSlide: (data.profile.main_profile_image - 1),
        // slidesToShow: 1,
        // fade: true,
        // cssEase: 'linear',
      });
    }).fail(function(data) {
    });
  });

});

Handlebars.registerHelper('ifCond', function(v1, v2, options) {
  if(v1 === v2) {
    return options.fn(this);
  }
  return options.inverse(this);
});
