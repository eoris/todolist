$(document).ready(function(){
  $('.button').click(function() {
    $('.new_project').css("display", "block"); 
  });

  $('.add_new_project').click(function() {
  	$('.new_project').fadeOut(500);
  });
})