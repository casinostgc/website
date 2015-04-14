$ ->

	$('.froala_content').editable
		inlineMode: false
		height: 300
		imageUpload: false

	$('[data-toggle="tooltip"]').tooltip()
	$('[data-toggle="popover"]').popover
		trigger: 'hover'

	$('body').on 'cocoon:after-insert', (e, insertedItem) ->
		unsavedChanges()
		return

	$('body').on 'cocoon:after-remove', (e, insertedItem) ->
		unsavedChanges()
		return

	unsavedChanges = ->
		$('#picturesModified').show()
		$('input[type=submit]').addClass 'btn-warning'
		return