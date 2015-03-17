# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$('#sortableMenuItems').sortable
		axis: 'y'
		# items: "> li.list-group-item > a.draggable"
		update: ->
			$.post( $(this).data('sort-url'), $(this).sortable('serialize') )