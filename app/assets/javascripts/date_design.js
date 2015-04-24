$(document).on('page:change', function() {

	var dateId = $('#selected-experience').attr('data-playdate-id');
	var experienceId = $('#selected-experience .select-experience-btn').attr('data-experience-id');
	if (!$('#recipient-confirmed').hasClass('fa-check-circle') || !$('#initiator-confirmed').hasClass('fa-check-circle')) {
		$('#selected-experience .experience-details').prepend('<a href="/dates/' + dateId + '/delete" data-experience-id="'+ experienceId +'" class="selected-experience-delete-btn"><i class="close-icon fa fa-times"></i></a>')
	}

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
			if ($('.disabled-button')) {
				if ($('#recipient-accepted').hasClass('fa-check-circle')) {
					$('.accept-confirm-pay-wrapper').html('<a id="confirm-invitation" class="accept-confirm-pay-btn" href="/dates/' + data.playdate.id + '/confirm">Confirm Date Selection</a>');
				} else if (data.recipient) {
					$('.accept-confirm-pay-wrapper').html('<a id="accept-invitation" class="accept-confirm-pay-btn" href="/dates/' + data.playdate.id + '/accept">Accept Invitation</a>');
				};
			};
			$('.experience-wrapper').animate({ scrollTop: 0 }, 'slow');
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
			$('#recipient-confirmed').removeClass('fa-check-circle').addClass('fa-circle-thin');
			$('#initiator-confirmed').removeClass('fa-check-circle').addClass('fa-circle-thin');
		});

	});

	$('.playdate-container').on('click', '#accept-invitation', function(e) {
		e.preventDefault();

		$.ajax({
			url: $(this).attr('href'),
			type: 'POST',
			dataType: 'JSON'
		}).done(function(data) {
			$('#recipient-accepted').removeClass('fa fa-circle-thin').addClass('fa fa-check-circle');
			$('#accept-invitation').attr('href', '/dates/' + data.dateId + '/confirm');
			if ($('#selected-experience').text() == '') {
				$('#accept-invitation').text('Confirm Date Selection');
			} else {
				$('#accept-invitation').addClass('hidden');
			}
		});
	});

	$('.playdate-container').on('click', '#confirm-invitation', function(e) {
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
			if ($('#recipient-confirmed').hasClass('fa-check-circle') && $('#initiator-confirmed').hasClass('fa-check-circle')) {
				$('#confirm-invitation').remove();
				$('.pay-btn-wrapper').removeClass('hidden');
				$('.food-and-drink-container').slideUp();
				$('.movie-container').slideUp();
				$('.selected-experience-delete-btn').remove();
			} else {
				$('.accept-confirm-pay-wrapper').html('<div class="disabled-button desaturate italics">Awaiting confirmation from other parent</div>');
			}
		});
	});

	var modalSetting = {
	  onOpen: function (dialog) {
	    dialog.data.fadeIn('medium');
	    dialog.container.fadeIn('medium');
	    dialog.overlay.fadeIn('fast');
	    $("html,body").css("overflow","hidden"); // disables scrolling on page in background
	  },
	  onShow: function(dialog) {
	    $('.flip-wrapper').height($('.pf-box').outerHeight()); // resizes modal to account for height of absolutely positioned flipping boxes
	    $('#simplemodal-container').css({'height' : 'auto'}); // necessary to fix simplemodal positioning
	    $('.pf-modal-container').on('click', '.pf-box-wrapper', function(e){
	      var target = $(event.target).closest('.flip-wrapper');
	      target.toggleClass('flipped');
	    })
	  },
	  onClose: function(dialog) {
	    dialog.data.fadeOut('fast');
	      dialog.overlay.fadeOut('medium', function(){
	        $.modal.close(); // without this, if you close modal with ESC, you can't open it again
	      });
	    $("html,body").css("overflow","auto"); //re-enables scrolling on main page
	  },
	  opacity: 88,
	  overlayClose: true,
	  show: true,
	  overlayCss: {backgroundImage: "url('/images/backgrounds/bg-dark_exa.png')"},
	};

	$('a.date-participant-image').on('click', function(e) {
	    e.preventDefault();
	    $.ajax({
	      url: $(this).attr('href'),
	    }).done(function(data) {
	      var source = $('#date-participant-image-template').html();
	      var templatingFunction = Handlebars.compile(source);
	      $(templatingFunction(data)).modal(modalSetting);
	      $('#gallery-wrap').slick({
	        dots: true,
	        infinite: true,
	        speed: 700,
	        initialSlide: (data.profile.main_profile_image - 1),
	        autoplay: true,
	        slidesToShow: 1,
	        autoplaySpeed: 6000,
	        // fade: true,
	        // cssEase: 'linear',
	      });
	      $(window).resize(); // necessary to fix simplemodal positioning
	    }).fail(function(data) {
	    });
	  });

});
