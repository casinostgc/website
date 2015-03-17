module AdminHelper

	def admin_nav_item(text, url)
		url_info = Rails.application.routes.recognize_path url
		link_to text, url, class: ['list-group-item', ( 'list-group-item-info' if url_info[:controller] == params[:controller] )]
	end

end
