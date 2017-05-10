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

    $(".select-radio-styling input").change(function () {
        $(".select-radio-styling").children("label").removeClass("active");
        $(this).prev().addClass("active");
        var data=({visa_help_type: $(this).val(), step_number: $("#step_number").val() });
        // ajax_visa_process(data);
        $("#select_step_1").submit();
    })


    function ajax_visa_process(data){
        $.ajax({
            url: "help_steps",
            type: "POST",
            data: data,
            dataType: JSON,
            success: function(response){
                next_view(response.step+1);

            },
            error: function (response) {

            }
        });
    }
});


function next_view(step){

}
