$ ->

	# $('.adminMenuPanel .panel-collapse').collapse toggle: false

	$('.adminMenuPanel').each ->
		$(this).hover (->
			$(this).find('.panel-collapse').collapse 'show'
			return
		), ->
			$(this).find('.panel-collapse').collapse 'hide'
			return
		return

	# $('body').mousemove ->
	# 	unless $('#adminMenuAccordiion').is('hover')
	# 		$('.adminMenuPanel .panel-collapse').each ->
	# 			$(this).collapse 'hide'
	# 			return
	# 	return