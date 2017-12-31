$(document).ready(function(){
  // controls the top navigation bar as you scroll
  $(document).scroll(function(){
    if ($(document).scrollTop() > 150) {
      $('nav.front-page').css({
        background: '#c5c1c1c4',
        transition: '.3s'
      });
  } else {
      $('nav.front-page').css('background', '#c5c1c1c4');
    }
  });

  $(".select-radio-styling input").change(function () {
      $(".select-radio-styling").children("label").removeClass("active");
      $(this).prev().addClass("active");
      var data=({visa_help_type: $(this).val(), step_number: $("#step_number").val() });
      $("#select_step_1").submit();
  })

  $(".default-datetimepicker").datetimepicker({
    minDate: moment(),
    format: 'DD-MM-YYYY HH:mm'
  });

  $(".default-datepicker").datetimepicker({
    minDate: moment(),
    format: 'DD-MM-YYYY'
  });
})
