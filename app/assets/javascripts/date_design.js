$(document).on('page:change', function() {

	var dateId = $('#selected-experience').attr('data-playdate-id');
	var experienceId = $('#selected-experience .select-experience-btn').attr('data-experience-id');

	$('#selected-experience .experience-details').prepend('<a href="/dates/' + dateId + '/delete" data-experience-id="'+ experienceId +'" class="selected-experience-delete-btn"><i class="close-icon fa fa-times"></i></a>')

	$('.playdate-container').on('click', '.select-experience-btn a', function(e) {
		e.preventDefault();

		var experienceId = $(this).attr('data-experience-id');

		var $chooseExperienceBtn = $(this).parent()

		$.ajax({
			url: $(this).attr('href'),
			type: 'PATCH',
			dataType: 'JSON',
			data: { experience_id: experienceId }
		}).done(function(data) {
			var $experienceCard = $('#selected-experience .date-experience-card')
			$experienceCard.fadeOut('slow', function() {
				$experienceCard.remove();
			});
			var source = $('.date-experience-card-template').html();
			var templatingFunction = Handlebars.compile(source);
			var context = data;
			$('.design-date-notification').text('');
			$chooseExperienceBtn.addClass('hidden');
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
			var $experienceCard = $('#selected-experience .date-experience-card')
			$experienceCard.fadeOut('slow', function() {
				$experienceCard.remove();
			});
			$('.select-experience-btn').removeClass('hidden');
			$('.design-date-notification').text('No Experience Selected');
		}).fail(function(data) {

		});

	});

});