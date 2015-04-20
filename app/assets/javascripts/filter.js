// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('page:change', function() {
  if ($('div').is('.welcome-page-loggedin')){

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

      var filterParams = $("form.filters").serialize() + "&by_sexual_preference=" + gender; //refactor to use session
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



