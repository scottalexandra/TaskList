$(function(){
  $("#change-status").click(function(){
    $(this).parent('<%= task.title %>').submit();
  });
});
