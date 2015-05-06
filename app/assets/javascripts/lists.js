$(document).ready(function(){

  toggleDiv("#show-archived",
            "#archived-lists",
            "#show-current",
            "#current-lists");

  function toggleDiv(buttonID, divID, divID2, buttonID2){
    $(buttonID).on("click", function(){
      $(divID2).addClass("hidden");
      $(divID).removeClass("hidden");
      $(buttonID).addClass("colorize");
      $(buttonID2).removeClass("colorize");
    });
  }
})
