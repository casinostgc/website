# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	$('.datetimepicker').datetimepicker
		icons:
			time: 'fa fa-clock-o'
			date: 'fa fa-calendar'
			up: 'fa fa-chevron-up'
			down: 'fa fa-chevron-down'
			previous: 'fa fa-chevron-left'
			next: 'fa fa-chevron-right'
			today: 'fa fa-crosshairs'
			clear: 'fa fa-trash'
		# format: 'm/d/Y I:M p'