$(document).ready(function(){
  $(document).scroll(function(){
    if ($(document).scrollTop() > 150) {
      $('nav').css({
        background: 'rgba(0,0,0,0.8)',
        transition: '.3s'
      });
    } else {
      $('nav').css('background', 'rgba(0,0,0,0)');
    }
  });
  $(".select-radio-styling input").change(function () {
      $(".select-radio-styling").children("label").removeClass("active");
      $(this).prev().addClass("active");
      var data=({visa_help_type: $(this).val(), step_number: $("#step_number").val() });
      $("#select_step_1").submit();
  })
});
