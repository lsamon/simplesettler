function getUrlParams(url){
  var substringStartPos = url.lastIndexOf('/') + 1;
  return url.substr(substringStartPos).split('#');
}

$(document).ready(function(){
  var category = getUrlParams(window.location.href)[1];
  var city = getUrlParams(window.location.href)[0];
  $('.' + category + ' a').addClass('active');

  $('.categorySelect a').click(function() {
    $('.categorySelect a').removeClass('active');
    $(this).addClass('active');
  });
  
  if(($('.articleSelectContainer').length > 0) && category != undefined){
    $.ajax({
      type: 'GET',
      url: '/cities/'+city+'/'+'categories/'+category,
      beforeSend: function(){
        $('.articles').hide();
      },
      success: function(){
        $('.articles').show();
      }
    });
  }
});
