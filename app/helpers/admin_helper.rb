module AdminHelper

	def admin_nav_item(text, url, &block)
		content = block_given? ? (link_to(text, url) + capture(&block)).html_safe : text
		url_info = Rails.application.routes.recognize_path url
		active = url_info[:controller] == params[:controller]

		if active
			content_tag :li, content, class: 'list-group-item list-group-item-warning'
		else
			link_to text, url, class: 'list-group-item'
		end
	end

end
