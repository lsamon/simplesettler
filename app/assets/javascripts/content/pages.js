$(document).ready(function(){
  $(document).scroll(function(){
    if ($(document).scrollTop() > 200) {
      $('nav').css({
        background: 'rgba(0,0,0,0.8)',
        transition: '.3s'
      });
    } else {
      $('nav').css('background', 'rgba(0,0,0,0)');
    }
  });
});
