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
	
	# class methods
	
	# instance methods
	
	# filters
	def should_generate_new_friendly_id?
		slug.blank?
	end
	
	# validations
	
	
end
