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
			$('.select-experience-btn').removeClass('hidden');
			$chooseExperienceBtn.addClass('hidden');
			$('#selected-experience').append(templatingFunction(context));
			if ($('#recipient-accepted').hasClass('fa-check-circle')) {
				$('.accept-confirm-pay-wrapper').show();
			};
			$('#recipient-confirmed').removeClass('fa-check-circle').addClass('fa-circle-thin');
			$('#initiator-confirmed').removeClass('fa-check-circle').addClass('fa-circle-thin');
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
			if ($('#recipient-accepted').hasClass('fa-circle-thin')) {
				$('.accept-confirm-pay-wrapper').show();
			} else {
				$('.accept-confirm-pay-wrapper').hide();
			};
		});

	});

	$('#accept-invitation').on('click', function(e) {
		e.preventDefault();

		$.ajax({
			url: $(this).attr('href'),
			type: 'POST',
			dataType: 'JSON'
		}).done(function(data) {
			$('#recipient-accepted').removeClass('fa fa-circle-thin').addClass('fa fa-check-circle');
			$('#accept-invitation').attr('href', '/dates/' + data.dateId + '/confirm');
			$('#accept-invitation').text('Confirm Date Selection');
		});
	});

	$('#confirm-invitation').on('click', function(e) {
		e.preventDefault();

		$.ajax({
			url: $(this).attr('href'),
			type: 'POST',
			dataType: 'JSON'
		}).done(function(data) {
			if (data.recipient) {
				$('#recipient-confirmed').removeClass('fa fa-circle-thin').addClass('fa fa-check-circle');
			} else {
				$('#initiator-confirmed').removeClass('fa fa-circle-thin').addClass('fa fa-check-circle');
			};
			$('.accept-confirm-pay-wrapper').html('<div class="disabled-button desaturate italics">Awaiting confirmation from other parent</div>');
		});
	});

});