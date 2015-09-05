$(document).ready(function(){

//line-through on done tasks
$('.task:has(input:checked) span.task_entered_name').addClass('lined');

//show "Add project" form
  $('.button').click(function() {
    $('.new_project').css("display", "block");
    return false; 
  });

//hide title and show edit project form
  $('.projects').on('click', ".title_pen_list_img", function(){
    $(this).parents(".project").find(".title").hide();
    $(this).parents(".project").find('.edit_project').css("display", "inline-block");
    return false; 
  });

//show title and hide edit project form
  $('.projects').on('click', ".edit_project_button", function(){
    $(this).parents(".project").find(".title").show();
    $(this).parents(".project").find(".edit_project").css("display", "none");
  });

//hide task title and show edit task form
  $('.projects').on('click', ".pen_list_img", function(){
    $(this).parents(".task").find(".task_name").hide();
    $(this).parents(".task").find('.edit_task').css("display", "inline-block");
  });

//show task and hide edit task form
  $('.projects').on('click', ".edit_task_button", function(){
    $(this).parents(".task").find(".task_name").show();
    $(this).parents(".task").find(".edit_task").css("display", "none");
  });


//sorting tasks
  $('.projects').on('mouseenter', '.task', function() {
    $('.tasks_ul').sortable({
      items: 'li',
      cursor: 'move',
      update: function(){
      $.ajax({
        url: $(this).attr('update-url-data'),
        type: 'post',
        data: $(this).sortable('serialize')
        });
      }
    });
  });

//checkbox
  $('.projects').on('change','.checkbox', function() {
    var projectId = $(this).parents(".project").attr("id");
    var taskId = $(this).parents(".task").attr("id").substring(5, 9999);
    var path = "projects/" + projectId + "/tasks/" + taskId;
    var done = $(this).parents(".task").find(".checkbox").prop("checked");
    $.ajax({
      type: "put",
      url: path,
      data: {"task[done]":done}
    });
    return false;
  });

//line-through on done tasks
  $('.projects').on('change','.checkbox', function() {
    if (this.checked) $(this).parents('.task').find('span.task_entered_name').addClass('lined');
    else $(this).parents('.task').find('span.task_entered_name').removeClass('lined');
  })

})
