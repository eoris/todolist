$(document).ready(function(){
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
//   $(".checkbox").on('change', function(){
//   if (this.checked){
//     $.ajax({
//       url: '/todos/'+this.value+'/toggle',
//       type: 'PUT',
//       data: {"completed": this.checked}
//     });
//   }
//   else {
//      alert("no");
//   }
// });

  // $('.projects').on('change','.checkbox', function() {
  //   var done = $(this).parents(".task").find(".checkbox").prop("checked");
  //   $.ajax({
  //     url: $(this).parents(".task").find(".task_checkbox").attr('checkbox-url-data'),
  //     type: "put",
  //     data: {"task[done]":done}
  //   });
  //   return false;
  // }); 

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

})