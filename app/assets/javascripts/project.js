$(document).ready(function(){
//show "Add project" form
  $('.button').click(function() {
    $('.new_project').css("display", "block");
    return false; 
  });

//remove project window
  $('.projects').on('click', ".title_trash_list_img", function(){
  	$(this).parents(".project").fadeOut(500, function() {
  		$(this).remove();
  	});
  });

  $('.projects').on('click', ".title_pen_list_img", function(){
  	$('.title').hide();
  	$('.edit_project').css("display", "inline-block");
  	return false;
  });

  // $('.projects').on('click', ".title_pen_list_img", function(){
  // 	$('.edit_project').css("display", "inline-block");
  // 	return false;
  // });

})
