// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){


  $('.login-btn').click(function(e){
  	e.preventDefault();
    $('#login-modal').modal();
  })

  $('.signup-btn').click(function(e){
  	e.preventDefault();
    $('#signup-modal').modal()
  })


	$('.how-btn').click(function() {
	    $('body').animate({
	        scrollTop: $('#how-it-works').offset().top
	    }, 750);
	});
})

