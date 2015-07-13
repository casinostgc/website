# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$('#sortableMenuItems').sortable
		axis: 'y'
		# items: "> li.list-group-item > a.draggable"
		update: ->
			$.post( $(this).data('sort-url'), $(this).sortable('serialize') )

	# enable custom url on select
	checkPageSelector = ->
		if $('#admin_menu_item_page_id option:selected').val() == ''
			$('#admin_menu_item_href').prop 'disabled', false
		else
			$('#admin_menu_item_href').prop 'disabled', true
			$('#admin_menu_item_href').val ''
			# $.post( $(this).data('sort-url'), $(this).sortable('serialize') )

	checkPageSelector()
	$('#admin_menu_item_page_id').change ->
		checkPageSelector()
		if $('#admin_menu_item_value').val() == ''
			$('#admin_menu_item_value').val $(this).find(":selected").text()
	

	$('#admin_menu_item_icon').change ->
		$('#iconPreview').attr 'class', 'fa fa-fw fa-'+$(this).find(":selected").val()