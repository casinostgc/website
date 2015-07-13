module Content
	extend ActiveSupport::Concern

	include ActionView::Helpers

	def excerpt(limit=180)
		ActionView::Base.full_sanitizer.sanitize(self.content.first(limit)) + '...'
	end

	def rendered_content
		if self.content.present?
			self.content.gsub(/\[(.*?)\]/) { |s| generateShortcodeContent(s[1..-2]) }.html_safe
		else
			content_tag :p, 'Content coming soon...', class: 'lead text-muted'
		end
	end

	def generateShortcodeContent(shortcodeStr)
		ActionView::Base.new(Rails.configuration.paths["app/views"].first).render(partial: "layouts/shortcodes/#{shortcodeStr}")
	rescue
		return "[#{shortcodeStr}]"
	end

end