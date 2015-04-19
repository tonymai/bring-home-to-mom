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
