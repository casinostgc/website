class MenuItem < ActiveRecord::Base

	include Rails.application.routes.url_helpers

	default_scope { order(position: :asc) }

	acts_as_list

	belongs_to :page

	validates :value, presence: true
	validates :page_id, presence: { unless: :href? }

	def link
		page_id.present? ? short_page_path(Page.find(page_id)) : href
		# '#'
	end

end
