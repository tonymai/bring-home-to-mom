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
			debugger
			var source = $('.date-experience-card-template').html();
			var templatingFunction = Handlebars.compile(source);
			var context = data;
			$('.design-date-notification').hide();
			$('.date-design-section-body').append(templatingFunction(context));
			// $('.food-and-drink-container').hide();
		}).fail(function(errors) {

		});

	});

	$('.selected-experience-container').on('click', '.selected-experience-delete-btn', function(e) {
		e.preventDefault();

		var experienceId = $(this).attr('data-experience-id')

		$.ajax({
			url: $(this).attr('href'),
			type: 'PATCH',
			dataType: 'JSON',
			data: { experience_id: experienceId }
		}).done(function(data) {
			$('#selected-event').empty();
		}).fail(function(data) {

		});

	});

});