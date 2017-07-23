var showModal = function(){
  $('.overlay').addClass('is-open').removeClass('is-closed');
  $('.js-modal').show();
}

var hideModal = function(){
  $('.overlay').addClass('is-closed').removeClass('is-open');
  $('.js-modal').hide();
}

$(document).ready(function() {
  hideModal();
  $('.signInOutButton').on('click', function(e){
    e.preventDefault();
    if($('.overlay').hasClass('is-open')){
      hideModal();
    } else {
      showModal();
    }
  })

  $('ul.tabs li').click(function() {
    var tab_id = $(this).attr('data-tab');
    $('ul.tabs li').removeClass('current');
    $('.form-content').removeClass('current');
    $(this).addClass('current');
    $("#" + tab_id).addClass('current');
  })
});
