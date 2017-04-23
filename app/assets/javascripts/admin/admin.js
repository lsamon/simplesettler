$(document).on('click', '.nav-item', function(e){
  // e.preventDefault();
  if(!$(this).hasClass('active')){
    $(this).siblings().removeClass("active");
    $(this).addClass("active");
  }
});

$(document).on('change', '[data-boolean-toggle]', function(){
   $( $(this).data('booleanToggle') ).toggle();
});

$(document).on('click', '[data-toggle]', function(){
   $( $(this).data('toggle') ).toggle();
   var $icon = $(this).children().first();

  $icon.toggleClass('fa fa-minus fa fa-plus', 'slow', "easeOutSine");
});
