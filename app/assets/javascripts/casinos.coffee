# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	if $('.casino').length
		marker_arr = []
		$('.casino').each ->
			casino = $(this).data('casino')
			unless casino.latitude == null
				infoWindow = '<p><strong>'+casino.name+'</strong></p>'
				# infoWindow += $(this).find('a').attr('src')
				marker_arr.push
					lat: casino.latitude
					lng: casino.longitude
					infowindow: infoWindow
			return
		handler = Gmaps.build('Google')
		handler.buildMap {
			provider: {}
			internal: id: 'casinosMap'
		}, ->
			markers = handler.addMarkers(marker_arr)
			handler.bounds.extendWith markers
			handler.fitMapToBounds()
			return