$(document).ready(function(){
  var hashString = window.location.hash;
  console.log(hashString);

  $('.catAll').addClass('active');

  $('.categorySelect a').click(function() {
    $('.categorySelect a').removeClass('active');
    $(this).addClass('active');
  });
});
