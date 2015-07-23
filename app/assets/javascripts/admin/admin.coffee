
$ ->

	# froala editor
	$('.froala_content').editable
		inlineMode: false
		height: 300
		imageLink: false
		imageUpload: false

	# datetimepicker
	initDateTimePicker = ->
		$('.datetimepicker').datetimepicker
			# minDate: moment()
			icons:
				time: 'fa fa-clock-o'
				date: 'fa fa-calendar'
				up: 'fa fa-arrow-up'
				down: 'fa fa-arrow-down'
				next: 'fa fa-chevron-right'
				previous: 'fa fa-chevron-left'
	initDateTimePicker()
	
	$('body').on "dp.change", ".datetimepicker.start", (e) ->
		stamp = $(this).data('stamp')
		$('#end'+stamp).data('DateTimePicker').minDate e.date
		return
	$('body').on "dp.change", ".datetimepicker.end", (e) ->
		stamp = $(this).data('stamp')
		$('#start'+stamp).data('DateTimePicker').maxDate e.date
		return

	# $('body').on 'cocoon:before-insert', (e, insertedItem) ->
		
	# 	return

	$('body').on 'cocoon:after-insert', (e, insertedItem) ->
		stamp = (new Date).getTime()
		insertedItem.find('.datetimepicker').each ->
			if $(this).hasClass('start')
				$(this).attr('data-stamp', stamp).attr('id', 'start'+stamp)
			else if $(this).hasClass('end')
				$(this).attr('data-stamp', stamp).attr('id', 'end'+stamp)
		initDateTimePicker()
		return

	# $('body').on 'cocoon:after-remove', (e, insertedItem) ->
	# 	# specify on pictures
	# 	# unsavedChanges()
	# 	return

	# unsavedChanges = ->
	# 	$('#picturesModified').show()
	# 	$('input[type=submit]').addClass 'btn-warning'
	# 	return