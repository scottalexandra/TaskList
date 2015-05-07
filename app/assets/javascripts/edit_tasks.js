$(function(){
  $("input[type=checkbox]").on("click", function(){
    var taskId = $(this).closest('tr').data('task-id');
    var listID = $(this).closest('tr').data('list-id');
    var taskElement = $(this).closest("tr");
    $.ajax({
      url: '/tasks/' + taskId,
      type: 'PUT',
      data: {task: {completed: true, }},
      success: function(data) {
        console.log("completed complete");
        taskElement.appendTo(".complete-tasks");
        console.log(data);
      }
    })
  });
});
