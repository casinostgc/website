module AdminHelper

	def is_admin?
		current_user ? current_user.admin : false
	end

	def admin_nav_item(text, url, &block)
		url_info = Rails.application.routes.recognize_path url
		active = url_info[:controller] == params[:controller]

		block = block_given? ? capture(&block) : nil
		render 'nav_item', text: text, url: url, active: active, block: block
	end

end