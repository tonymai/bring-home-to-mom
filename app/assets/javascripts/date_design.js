$(document).on('page:change', function() {

	$('.playdate-container').on('click', '.select-experience-btn a', function(e) {
		e.preventDefault();

		var experienceId = $(this).attr('data-experience-id');

		$.ajax({
			url: $(this).attr('href'),
			type: 'PATCH',
			dataType: 'JSON',
			data: { experience_id: experienceId }
		}).done(function(data) {
			// $('#selected-event').fadeOut('slow', function() {
			// 	$('#selected-event').remove();
			// });
			var source = $('.date-experience-card-template').html();
			var templatingFunction = Handlebars.compile(source);
			var context = data;
			$('.design-date-notification').hide();
			$('#selected-experience').append(templatingFunction(context));
		}).fail(function(errors) {

		});

	});

	$('.selected-experience-container').on('click', '.selected-experience-delete-btn', function(e) {
		e.preventDefault();

		var experienceId = $(this).attr('data-experience-id')
		$.ajax({
			url: $(this).attr('href'), //need to send to different action
			type: 'POST',
			dataType: 'JSON'
		}).done(function(data) {
			debugger
			var $experienceCard = $('#selected-experience .date-experience-card')
			$experienceCard.fadeOut('slow', function() {
				$experienceCard.remove();
			});
			$('.design-date-notification').show();
		}).fail(function(data) {

		});

	});

});