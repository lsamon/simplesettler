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

$(document).on('change', '#article_content_type', function(){
  if($(this).val() === 'about'){
    $('.article_featured').hide();
    $('.article_status').hide();
    $('.article_cities').hide();
    $('.article_category').hide();
    $('#article_image').hide();
  }else {
    $('.article_featured').show();
    $('.article_status').show();
    $('.article_cities').show();
    $('.article_category').show();
    $('#article_image').show();
  }
})
