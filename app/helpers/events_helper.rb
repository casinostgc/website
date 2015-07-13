module EventsHelper

	def sti_event_pictures_path(event)
		send "#{event.type.underscore}_pictures_path", event
	end

	def sti_event_path(type = "event", event = nil, action = nil)
		send "#{format_sti(action, type, event)}_path", event
	end

	def format_sti(action, type, event)
		action || event ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
	end

	def format_action(action)
		action ? "#{action}_admin_" : ""
	end

end
