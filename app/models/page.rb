class Page < ActiveRecord::Base

	include Content

	default_scope { order(title: :asc) }

	has_many :menu_items, dependent: :destroy

	extend FriendlyId
	friendly_id :title, use: :slugged
	def should_generate_new_friendly_id?
		slug.blank?
	end

end
