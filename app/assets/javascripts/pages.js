$(document).ready(function(){
  $(window).resize(function() {
    console.log("resize");
    $( ".ui-autocomplete-input" ).autocomplete( "search" );
  });

  $(".ui-autocomplete-input").autocomplete({
    focus: function(e,ui) {
      e.preventDefault();
    }
  });

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

$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
