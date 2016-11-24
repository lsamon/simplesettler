$(document).ready(function(){
  var hashString = window.location.hash;
  console.log(hashString);

  $('.fa-star').click(function() {
    $('.ratingsYo').fadeToggle();
    $('.rateCity').fadeToggle();
  });

  $('.catAll').addClass('active');

  $('.categorySelect a').click(function() {
    $('.categorySelect a').removeClass('active');
    $(this).addClass('active');
  });
});
