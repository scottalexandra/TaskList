$(document).ready(function(){

  toggleDiv("#show-archived",
            "#archived-lists",
            "#current-lists",
            "#show-current");

  toggleDiv("#show-current",
            "#current-lists",
            "#archived-lists",
            "#show-archived");

  function toggleDiv(buttonID, divID, divID2, buttonID2){
    $(buttonID).on("click", function(){
      $(divID2).addClass("hidden");
      $(divID).removeClass("hidden");
      $(buttonID).addClass("active");
      $(buttonID2).removeClass("active");
    });
  }
})
