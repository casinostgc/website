# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	if $('.port-of-call').length
		marker_arr = []
		$('.port-of-call').each ->
			port = $(this).data('port')
			if $(this).data('lat') != null
				infoWindow = '<p><strong>'+port.name+'</strong></p>'
				# infoWindow += $(this).find('a').attr('src')
				marker_arr.push
					lat: port.latitude
					lng: port.longitude
					infowindow: infoWindow
			return
		handler = Gmaps.build('Google')
		handler.buildMap {
			provider: {}
			internal: id: 'pocMap'
		}, ->
			markers = handler.addMarkers(marker_arr)
			handler.bounds.extendWith markers
			handler.fitMapToBounds()
			return