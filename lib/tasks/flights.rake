# requirements

namespace :flights do

	task test: :environment do

	end


	task test_import: :environment do
		file = File.open("#{Rails.root}/lib/assets/flight-schedule.csv")
		options = {}
		options[:erase] = true
		Flight.import(file, options)
	end

end
