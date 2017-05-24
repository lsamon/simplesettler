$(function(){
    var stripe = Stripe('pk_test_2PhDdYsaRSqRoMEPCWed8Y3S');

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
        var displayError = document.getElementById('card-errors');

        if (event.error) {
//      console.log(event.error);
            displayError.textContent = event.error.message;
        } else {
            displayError.textContent = '';
        }
    });



    var form = document.getElementById('payment-form');
    form.addEventListener('submit', function(event) {
        event.preventDefault();

        stripe.createToken(card).then(function(result) {
            if (result.error) {
                // Inform the user if there was an error
                var errorElement = document.getElementById('card-errors');
                errorElement.textContent = result.error.message;
            } else {
                $(".token").val(result.token);
                // Send the token to your server
                stripeTokenHandler(result.token);
            }
        });
    });






});


function stripeTokenHandler(token){
    $.ajax({
        url: $("#payment-form").attr("action"),
        method: "POST",
        data: {"token": token},
        success: function (data) {

        },
        error: function (data) {

        }
    });
}