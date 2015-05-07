$(function(){
  $("input[type=checkbox]").on("click", function(){
    var taskId = $(this).closest('tr').data('task-id');
    var listID = $(this).closest('tr').data('list-id');
    var taskElement = $(this).closest("tr");
    if($(this).closest('div') == "<div class='incomplete-task'></div>" ) {
      $.ajax({
        url: '/tasks/' + taskId,
        type: 'PUT',
        data: { task: { completed: true } },
        success: function(data) {
          taskElement.appendTo(".complete-tasks");
          console.log(data);
        }
      });
    } else if($(this).closest('div') == '.complete-task') {
      $.ajax({
        url: '/tasks/' + taskId,
        type: 'PUT',
        data: { task: { completed: false } },
        success: function(data) {
          taskElement.appendTo(".incomplete-tasks");
          console.log(data);
        }
      });
    };
  });
});
