module NestedPictures
	extend ActiveSupport::Concern

	included do
		has_many :pictures, as: :imageable
		accepts_nested_attributes_for :pictures, reject_if: proc { |attributes| attributes['image'].blank? }, allow_destroy: true
	end

end