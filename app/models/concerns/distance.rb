module Distance
	extend ActiveSupport::Concern

	def distance=(decimal)
		deciaml.round(2)
	end

end

