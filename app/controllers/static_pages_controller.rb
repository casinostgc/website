class StaticPagesController < ApplicationController

	layout 'pages', except: [:robots]
	layout false, only: [:email_signature]

	def index
	end

	def robots
		robots_file = ENV['EB_ENV'] == 'production' ? 'robots.production.txt' : 'robots.txt'
		robots = File.read(Rails.root + "lib/#{robots_file}")
		render text: robots, layout: false, content_type: "text/plain"
	end

	def email_signature

	end

end
