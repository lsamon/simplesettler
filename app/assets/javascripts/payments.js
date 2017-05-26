$(function(){
    var stripe = Stripe('pk_test_DMYrajCnPJHKlPIWWDlvv5ok');

    var elements = stripe.elements();

    var card = elements.create('card', {
        hidePostalCode: true,
        iconStyle: 'solid',
        style: {
            base: {
//        iconColor: '#666EE8',
                iconColor: '#00b6ab',
                color: '#00b6ab',
                lineHeight: '20px',
                fontWeight: 300,
                fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                fontSize: '15px',

                '::placeholder': {
                    color: '#CFD7E0',
                },
            },
            invalid: {
                iconColor: '#e85746',
                color: '#e85746',
            }
        }
    });

    card.mount('#card-element');

    card.addEventListener('change', function(event) {
        if (event.error) {
//      console.log(event.error);
            $(".payment-message").html(event.error.message);
            $(".payment-status-div").removeClass('hide');

        } else {
            $(".payment-message").html('');
            $(".payment-status-div").addClass('hide');

        }
    });


    var form = document.getElementById('payment-form');
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        stripe.createToken(card).then(function(result) {
            if (result.error) {
                // Inform the user if there was an error
                $(".payment-message").html(result.error.message);
                $(".payment-status-div").removeClass('hide');

            } else {
                $(".token").val(result.token);
                // Send the token to your server
                stripeTokenHandler(result.token);
            }
        });
    });
});


function stripeTokenHandler(token) {
    $("#payBtn").button('loading');
    blockOverlay("Please wait while we process your payment.");
    $.ajax({
        url: $("#payment-form").attr("action"),
        method: "POST",
        data: {"token": token},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            if (data.status == "success") {
                //redirect to success
                window.location = "success";
            } else {
                $(".payment-message").html(data.message);
                $(".payment-status-div").removeClass('hide');
                $.unblockUI();
                $("#payBtn").button('reset');

            }

        },
        error: function (data) {
            $.unblockUI();
            console.log(data);

        }
    });
}


    function blockOverlay(text) {
            $.blockUI({
                message: text,
                css: {
                    border: 'none',
                    padding: '15px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }
            });
}
