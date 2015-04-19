// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  var modalSetting = {
    onOpen: function (dialog) {
      dialog.data.fadeIn('fast');
      dialog.container.fadeIn('fast');
      dialog.overlay.fadeIn('fast');
    },
    opacity: 85
  };

  $('.login-btn').click(function(e){
  	e.preventDefault();
    $('#login-modal').modal(modalSetting);
  });

  $('.signup-btn').click(function(e){
  	e.preventDefault();
    $('#signup-modal').modal(modalSetting)
  });

  $('body').on('click', '.simplemodal-overlay', function() {
    $(this).fadeOut('fast');
    $('.simplemodal-wrap').fadeOut('fast', function() {
      $.modal.close();
    });
  });


	$('.how-btn').click(function() {
	  $('body').animate({
	    scrollTop: $('#how-it-works').offset().top
	  }, 750);
    return false;
	});


  $('.filterby').change(function(){
    //refactor this...
    var user_filters = $.map($("select.filterby").toArray(), function(e){return $(e).val();});
    var filterData = {
      gender: user_filters[0],
      religion: user_filters[1],
      smoke: user_filters[2],
    }



    $.ajax({
      url: '/filter',
      type: 'GET',
      dataType: 'JSON',
      data: {filterData},
    })
    .done(function(response) {
      $("tr").hide();
      $.each(response.match_ids, function(index, value){
          $("tr#" + value).show();
      });
    })


    // $("div.matches").find("tr").hide();
    // $("div.matches").find("div." + filters).show();
  })
})




    // $("div#FilterContainer").find("div").hide();
    // $("div#FilterContainer").find("div." + filters).show();
