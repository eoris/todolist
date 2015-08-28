$(document).ready(function(){
  $('.button').click(function() {
    $('.new_project').css("display", "block");
    return false; 
  });

  $('.projects').on('click', ".title_trash_list_img", function(){
  	$(this).parents(".project").fadeOut(500);
  });
})
