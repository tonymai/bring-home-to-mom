// $(document).on('page:change', function() {

// // 	$('.payment-form').on('submit', function(e) {
// // 		e.preventDefault();
// // 		debugger

// // 		$('.stripe-button-el').attr('disabled', 'disabled');

// // 		$.ajax({
// // 			url: $(this).attr('action'),
// // 			type: 'POST',
// // 			dataType: 'JSON'
// // 		}).done(function(data) {
// // 			debugger
// // 			window.location.href = "/dates/" + data.user_id
// // 		}).fail(function(data) {

// // 		});
// 	var handler = StripeCheckout.configure({
// 	  key: ENV['PUBLISHABLE_KEY'],
// 	  // image: '/img/documentation/checkout/marketplace.png',
// 	  token: function(token) {

// 	  	var userId = $(this).attr('data-user-id');
// 	  	debugger

// 	  	$.ajax({
// 	  		url: '/charges',
// 	  		type: 'POST',
// 	  		dataType: 'JSON',
// 	  		data: { user_id: userId }
// 	  	}).done(function(data) {
// 	  		debugger
// 	  	}).fail(function(data) {
// 	  		debugger
// 	  	});
// 	    // Use the token to create the charge with a server-side script.
// 	    // You can access the token ID with `token.id`
// 	  }
// 	});

// 	$('.date-purchase-btn').on('click', function(e) {
// 		debugger
// 	  // Open Checkout with further options
// 	  handler.open({
// 	    name: 'Buy Date',
// 	    // description: '2 widgets',
// 	    amount: 2000
// 	  });
// 	  e.preventDefault();
// 	});

// 	// Close Checkout on page navigation
// 	$(window).on('popstate', function() {
// 	  handler.close();
// 	});

// });

// Stripe.setPublishableKey('YOUR_PUBLISHABLE_KEY');

// function stripeResponseHandler(status, response) {
//     if (response.error) {
//         // re-enable the submit button
//         $('.submit-button').removeAttr("disabled");
//         // show the errors on the form
//         $(".payment-errors").html(response.error.message);
//     } else {
//         var form$ = $("#payment-form");
//         // token contains id, last4, and card type
//         var token = response['id'];
//         // insert the token into the form so it gets submitted to the server
//         form$.append("<input type='hidden' name='stripeToken' value='" + token + "' />");
//         // and submit
//         form$.get(0).submit();
//     }
// }

// $(document).ready(function() {
//     $("#payment-form").submit(function(event) {
//         // disable the submit button to prevent repeated clicks
//         $('.submit-button').attr("disabled", "disabled");
//         // createToken returns immediately - the supplied callback submits the form if there are no errors
//         Stripe.createToken({
//             number: $('.card-number').val(),
//             cvc: $('.card-cvc').val(),
//             exp_month: $('.card-expiry-month').val(),
//             exp_year: $('.card-expiry-year').val()
//         }, stripeResponseHandler);
//         return false; // submit from callback
//     });
// });

