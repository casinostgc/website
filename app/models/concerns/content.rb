module Content
	extend ActiveSupport::Concern

	def excerpt(limit=180)
		ActionView::Base.full_sanitizer.sanitize(self.content.first(limit)) + '...'
	end

	def rendered_content
		if self.content
			rendered = self.content.gsub(/\[(.*?)\]/) { |s|
				shortcode = s[1..-2]
				generateShortcodeContent(shortcode)
			}
			rendered.html_safe
		else
			nil
		end
	end

	def generateShortcodeContent(shortcodeName)
		ActionView::Base.new(Rails.configuration.paths["app/views"].first).render(partial: "layouts/shortcodes/#{shortcodeName}")
	rescue
		return "[#{shortcodeName}]"
	end

end