# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $ ->

	# if $('#portsMap').length
	# 	map = new GMaps(div: '#portsMap')
	# 	markerCoords = []
	# 	pathCoords = []
	# 	$('.port').each ->
	# 		icon = if $(this).data('index') == 0 then 'http://labs.google.com/ridefinder/images/mm_20_shadow.png' else 'http://labs.google.com/ridefinder/images/mm_20_red.png'
	# 		markerCoords.push
	# 			lat: $(this).data 'lat'
	# 			lng: $(this).data 'lng'
	# 			icon: icon
	# 		pathCoords.push [
	# 			$(this).data 'lat'
	# 			$(this).data 'lng'
	# 		]
	# 		return
	# 	markers = map.addMarkers markerCoords
	# 	path = map.drawPolyline path: pathCoords
	# 	map.fitZoom()

	# $('.datetimepicker').datetimepicker
	# 	icons:
	# 		time: 'fa fa-clock-o'
	# 		date: 'fa fa-calendar'
	# 		up: 'fa fa-chevron-up'
	# 		down: 'fa fa-chevron-down'
	# 		previous: 'fa fa-chevron-left'
	# 		next: 'fa fa-chevron-right'
	# 		today: 'fa fa-crosshairs'
	# 		clear: 'fa fa-trash'
	# 	# format: 'm/d/Y I:M p'