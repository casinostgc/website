class Port < ActiveRecord::Base

	include NestedPictures

	has_many :port_of_calls
	has_many :cruises, through: :port_of_calls

end
