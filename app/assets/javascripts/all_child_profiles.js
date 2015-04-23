$(document).on('page:change', function(e) {

	$('.all-child-profiles').on('click', '.child-pf-image a', function(e) {
		e.preventDefault();
		var childId = $(this).attr('data-profile-id')



		//reset all pf-pics to unselected
		$('.child-pf-image-sub').attr("class", "child-pf-image-sub");
			//desaturate all other pics
			$('.child-pf-image-sub').find("img").addClass('desaturate');
		//Add border to selected
		$(this).parent().addClass('pf-image-selected');
			//colorize selected child
			$('.pf-image-selected').find('img').removeClass("desaturate")


		$.ajax({
			url: '/',
			type: 'POST',
			dataType: 'JSON',
			data: { profile_id: childId }
		}).done(function(data) {
			var child = data.profile

			$('h1').attr('data-gender', child.gender);

			if (child.sexual_preference === 'men') {
			  child.gender = 'male';
			}
			else if (child.sexual_preference === 'women') {
			  child.gender = 'female';
			}
			else if (child.sexual_preference === 'no preference') {
			  child.gender = '';
			}

			$('.child-name').text(child.first_name);
			changeSelected('by_gender', child.gender);

			changeSelected('by_religion', child.religion);
			changeSelected('by_city', child.city);
			updateMatches();
			//upon ajax success, remove selected from existing filters and add to current  filters, change data-gender and its html to name, and then call updateMatches()
		}).fail(function(data) {

		});


	});

});

function changeSelected(name, value) {
	if (value != '') {
		return $('select[name="' + name + '"]').find('option')
		.removeAttr('selected')
		.filter('[value="' + value + '"]')
		.attr('selected', 'selected')
	}
};
