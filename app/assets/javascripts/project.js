$(document).ready(function(){
//show "Add project" form
  $('.button').click(function() {
    $('.new_project').css("display", "block");
    return false; 
  });

//remove project window
  // $('.projects').on('click', ".title_trash_list_img", function(){
  // 	$(this).parents(".project").fadeOut(500, function() {
  // 		$(this).remove();
  // 	});
  // });

//hide title and show edit project form
  $('.projects').on('click', ".title_pen_list_img", function(){
  	$(this).parents(".project").find(".title").hide();
  	$(this).parents(".project").find('.edit_project').css("display", "inline-block");
  });

//show title and hide edit project form
  $('.projects').on('click', ".edit_project_button", function(){
  	$(this).parents(".project").find(".title").show();
  	$(this).parents(".project").find(".edit_project").css("display", "none");
  });

//hide task title and show edit task form
  $('.projects').on('click', ".pen_list_img", function(){
  	$(this).parents(".task_block").find(".task_name").hide();
  	$(this).parents(".task_block").find('.edit_task').css("display", "inline-block");
  });

//show task and hide edit task form
   $('.projects').on('click', ".edit_task_button", function(){
  	$(this).parents(".task_block").find(".task_name").show();
  	$(this).parents(".task_block").find(".edit_task").css("display", "none");
  });

   $('.tasks_ul').sortable({
        update: function(){
          $.post($(this).data('update-url'), $(this).sortable('serialize')
    	);}
	});

})

