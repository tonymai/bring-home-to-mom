$(document).on('page:change', function() {

	$('.payment-form').on('submit', function(e) {
		e.preventDefault();
		debugger

		$('.stripe-button-el').attr('disabled', 'disabled');

		$.ajax({
			url: $(this).attr('action'),
			type: 'POST',
			dataType: 'JSON'
		}).done(function(data) {
			debugger
			window.location.href = "/dates/" + data.user_id
		}).fail(function(data) {

		});

});