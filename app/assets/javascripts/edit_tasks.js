$(function(){
  $("input[type=checkbox]").on("click", function(){
    var taskId = $(this).closest('tr').data('task-id');
    var listID = $(this).closest('tr').data('list-id');
    var taskElement = $(this).closest("tr");
    if(taskElement.closest("div").attr("class") == "incomplete-tasks") {
      $.ajax({
        url: '/tasks/' + taskId,
        type: 'PUT',
        data: { task: { completed: true } },
        success: function(data) {
          taskElement.appendTo(".complete-tasks table");
          console.log(data);
        }
      });
    } else {
      $.ajax({
        url: '/tasks/' + taskId,
        type: 'PUT',
        data: { task: { completed: false } },
        success: function(data) {
          taskElement.appendTo(".incomplete-tasks table");
          console.log(data);
        }
      });
    }
  });
});
