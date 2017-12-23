function getUrlParams(url){
  var substringStartPos = url.lastIndexOf('/') + 1;
  return url.substr(substringStartPos).split('#');
}

$(document).ready(function(){
  var category = getUrlParams(window.location.href)[1];
  if (category) {
    var tabPaneID = $('#'+category).attr('href');
    $(tabPaneID).addClass('active');
    $(tabPaneID).siblings().removeClass('active');
    $('#'+category).addClass('btn-primary');
  } else {
    $('#getting-started').addClass('btn-primary');
  }
})
