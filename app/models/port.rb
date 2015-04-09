class Port < ActiveRecord::Base

	has_many :port_of_calls
	has_many :cruises, through: :port_of_calls
	
	has_many :pictures, as: :imageable

end
