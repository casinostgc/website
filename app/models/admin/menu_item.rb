class Admin::MenuItem < ActiveRecord::Base

	# includes and requirements
	include Rails.application.routes.url_helpers

	acts_as_list

	# assocations
	belongs_to :page

	# scopes
	default_scope { includes(:page).order(position: :asc) }

	# callbacks

	# class methods

	# instance methods
	def link
		page_id.present? ? short_page_path(Page.find(page_id)) : href
	end

	# filters

	# validations
	validates :text, presence: true
	validates :page_id, presence: { unless: :href? }

end
