$(document).on('click', '.admin .nav-item .nav-link', function(e){
  // e.preventDefault();
  // var url = $(this).attr('href');
  // $.ajax({
  //     type: 'POST',
  //     url: url,
  //     success: function() {
  //       $(this).siblings().removeClass("active");
  //       $(this).addClass("active");
  //     }
  //   });
});

$(document).on('change', '[data-boolean-toggle]', function(){
   $( $(this).data('booleanToggle') ).toggle();
});

$(document).on('click', '[data-toggle]', function(){
   $( $(this).data('toggle') ).toggle();
   var $icon = $(this).children().first();

  $icon.toggleClass('fa fa-minus fa fa-plus', 'slow', "easeOutSine");
});
