
var loaded = function(){

  $(document).ready(function(){
    animateScrollingSideBar()
    setMenuButton()
   });
 }

function animateScrollingSideBar(){
  var $sidebar   = $("#sidebar"),
      $window    = $(window),
      offset     = $sidebar.offset(),
      topPadding = 15;

  $window.scroll(function() {
      if ($window.scrollTop() > offset.top) {
          $sidebar.stop().animate({
              marginTop: $window.scrollTop() - offset.top + topPadding
          });
      } else {
          $sidebar.stop().animate({
              marginTop: 0
          });
      }
  });
};

function setMenuButton(){
 $(".button-collapse").sideNav();
};


 $(document).on("page:load ready", loaded);
