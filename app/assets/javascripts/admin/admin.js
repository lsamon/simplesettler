$(document).on('click', '.nav-item', function(e){
  // e.preventDefault();
  if(!$(this).hasClass('active')){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
  }
});
