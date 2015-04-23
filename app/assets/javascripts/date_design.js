$(document).on('page:change', function() {

	$('.date-design-section-body').on('click', '.select-experience-btn a', function(e) {
		e.preventDefault();

		var experienceId = $(this).attr('data-experience-id');

		$.ajax({
			url: $(this).attr('href'),
			type: 'PATCH',
			dataType: 'JSON',
			data: { experience_id: experienceId }
		}).done(function(data) {
			// $('#selected-event').fadeOut(function() {
				$('#selected-event').empty();
			// });
			var source = $('.date-experience-card-template').html();
			var templatingFunction = Handlebars.compile(source);
			var context = data;
			$('.design-date-notification').hide();
			$('#selected-event').append(templatingFunction(context));
		}).fail(function(errors) {

		});

	});

	$('.selected-experience-container').on('click', '.selected-experience-delete-btn', function(e) {
		e.preventDefault();

		var experienceId = $(this).attr('data-experience-id')

		$.ajax({
			url: $(this).attr('href'), //need to send to different action
			type: 'PATCH',
			dataType: 'JSON',
			data: { experience_id: experienceId }
		}).done(function(data) {
			$('#selected-event').empty();
		}).fail(function(data) {

		});

	});

});