// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
  $(document).on('page:change', function() {

      $('#movie-wrap').slick({
        dots: true,
        infinite: true,
        centerMode: true,
        slidesToShow: 3,
        speed: 700,
        autoplay: true,
        autoplaySpeed: 6000,
        // fade: true,
        // cssEase: 'linear',
      });

    });