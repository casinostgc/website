$ ->

	$('#nested_attractions').sortable
		axis: 'y',
    items: '> .nested-fields',
    handle: '.handle'
		# items: "> li.list-group-item > a.draggable"
		update: (event, ui) ->
      $(this).find('.position').each (index) ->
        $(this).val(index)
