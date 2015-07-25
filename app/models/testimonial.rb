class Testimonial < ActiveRecord::Base

	include Content

	attr_accessor :gotcha

	default_scope { order(approved: :asc, created_at: :desc) }

	scope :approved, -> { where(approved: true) }

	validates :name, :subject, :content, presence: true

	validate do |testimonial|
		errors[:base] << "Must be human!" if testimonial.gotcha.present?
	end

end
