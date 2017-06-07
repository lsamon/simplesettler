function getUrlParams(url){
  var substringStartPos = url.lastIndexOf('/') + 1;
  return url.substr(substringStartPos).split('#');
}

$(document).ready(function(){
  var category = getUrlParams(window.location.href)[1];
  var city = getUrlParams(window.location.href)[0];

  console.log($('.' + category));
  $('.' + category + ' a').addClass('active');

  $.ajax({
    type: 'GET',
    url: '/cities/'+city+'/'+'categories/'+category
  });

  $('.categorySelect a').click(function() {
    $('.categorySelect a').removeClass('active');
    $(this).addClass('active');
  });
});
