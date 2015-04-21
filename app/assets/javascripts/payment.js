$(document).on('page:change', function() {

	$('.payment-form').on('submit', function(e) {
		$('.submit-btn').attr('disabled', 'disabled');

		var amount = 1000 // amount in cents
		Stripe.createToken({
			number: $('.card-number').val(),
			cvc: $('.card-cvc').val(),
			exp_month: $('.card-expiry-month').val(),
			exp_year: $('.card-expiry-year').val()
		}, amount, stripeResponseHandler);

		return false;
	});

});