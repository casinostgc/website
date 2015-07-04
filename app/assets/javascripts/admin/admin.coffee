
$ ->

	$('.froala_content').editable
		inlineMode: false
		height: 300
		imageUpload: false

	# $('body').on 'cocoon:after-insert', (e, insertedItem) ->
	# 	# specify on pictures
	# 	# unsavedChanges()
	# 	return

	# $('body').on 'cocoon:after-remove', (e, insertedItem) ->
	# 	# specify on pictures
	# 	# unsavedChanges()
	# 	return

	# unsavedChanges = ->
	# 	$('#picturesModified').show()
	# 	$('input[type=submit]').addClass 'btn-warning'
	# 	return