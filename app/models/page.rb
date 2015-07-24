class Page < ActiveRecord::Base

	# includes and requirements
	include Content
	
	extend FriendlyId
	friendly_id :title, use: :slugged

	# assocations
	has_many :menu_items, dependent: :destroy
	
	# scopes
	default_scope { order(title: :asc) }
	
	# callbacks
	before_save :update_front_page
	
	# class methods
	
	# instance methods
	
	# filters
	def should_generate_new_friendly_id?
		slug.blank?
	end

	def update_front_page
		Page.where(front_page: true).update_all(front_page: false) if self.front_page && self.front_page_changed?
	end
	
	# validations
	
	
end
