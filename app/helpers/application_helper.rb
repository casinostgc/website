module ApplicationHelper

	# def fa_icon(icon, fw=true, size='1x')
	# 	fw = (fw ? 'fa-fw' : nil)
	# 	" <i class=\"fa #{fw} fa-#{icon} fa-#{size}\"></i> ".html_safe
	# end

	def is_admin?
		current_user.try(:admin)
	end

end
