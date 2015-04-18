// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  $('.login-btn').click(function(){
    $('#login-modal').modal()
  })

  $('.signup-btn').click(function(){
    $('#signup-modal').modal()
  })


  $('.filterby').change(function(){
    var user_filters = $.map($("select.filterby").toArray(), function(e){return $(e).val();});
    debugger
    $.ajax({
      url: '/filter',
      type: 'GET',
      dataType: 'JSON',
      data: {filters: {user_filters}},
    })
    .done(function() {
      console.log("success");
    })


    // $("div.matches").find("tr").hide();
    // $("div.matches").find("div." + filters).show();
  })
})



    // $("div#FilterContainer").find("div").hide();
    // $("div#FilterContainer").find("div." + filters).show();
