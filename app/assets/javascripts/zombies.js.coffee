# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$('#toggle-bio').click (event) ->
		event.preventDefault()
		$(this).hide()
		$('#zombie_bio').show()
		
	$('div#custom_phase2 form').submit (event) ->
		event.preventDefault()
		
		url = $(this).attr('action');
		custom_decomp = $('div#custom_phase2 #zombie_decomposition').val()
		
		$.ajax
			type: 'put'
			url: url
			data: { zombie: { decomposition: custom_decomp } }
			dataType: 'json'
			success: (json) ->
				$('span#decomposition').text(json.decomposition)
				$('div#custom_phase2').fadeOut() if json.decomposition == "Dead (again)"
		