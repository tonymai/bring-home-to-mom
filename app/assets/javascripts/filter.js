// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:change', function() {
  if ($('div').is('.welcome-page-loggedin')){


    $('.age-slider').noUiSlider({
      start: [18,40],
      step: 1,
      connect: true,
      range:{
        'min': 18,
        'max': 50
      },
      format: wNumb({
      decimals: 0
      })
    });

    $('.age-slider').Link('lower').to($('#input-lower'));
    $('.age-slider').Link('upper').to($('#input-upper'));


    var updateMatches = function() {
      // var user_filters = $.map($("select.filterby").toArray(), function(e){return $(e).val();});
      // var filterData = {
      //   gender: user_filters[0],
      //   religion: user_filters[1],
      //   smoke: user_filters[2],
      //   childGender: $("h1").attr("data-gender")
      // }
      var gender = $("h1").attr("data-gender")
      if (gender = 'male') {
        gender = 'men';
      }
      else if (gender = 'female') {
        gender = 'women';
      }
      else {
        gender = 'both';
      }
      var lowerAge = $("#input-lower").val();
      var upperAge = $("#input-upper").val();
      var filterParams = $("form.filters").serialize() + "&by_sexual_preference=" + gender + "&by_age[min]=" + lowerAge + "&by_age[max]=" + upperAge; //refactor to use session
      console.log(filterParams)
      $.ajax({
        url: '/filter?' + filterParams,
        type: 'GET',
        dataType: 'JSON'
      })
      .done(function(response) {
        var source = $("#child_preview_template").html();
        var templatingFunction = Handlebars.compile(source);
        var context = {};
        context.match = response;
        $(".matches").text("");
        $(".matches").append(templatingFunction(context));
      });
    };

    updateMatches();

    $('.filterby').change(updateMatches);


  };
});



