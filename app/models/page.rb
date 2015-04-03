class Page < ActiveRecord::Base

	default_scope { order(title: :asc) }

	extend FriendlyId
	friendly_id :title, use: :slugged

	def should_generate_new_friendly_id?
		slug.blank?
	end

	include Content

	has_many :menu_items

end
