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

//hide title and show edit project form
  $('.projects').on('click', ".title_pen_list_img", function(){
  	$(this).parents(".project").find(".title").hide();
  	$(this).parents(".project").find('.edit_project').css("display", "inline-block");
  });


  $('.projects').on('click', ".edit_project_button", function(){
  	$(this).parents(".project").find(".title").show();
  	$(this).parents(".project").find(".edit_project").css("display", "none");
  });

})
