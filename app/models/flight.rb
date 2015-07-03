class Flight < ActiveRecord::Base

	# includes and requirements
	require 'smarter_csv'
	require 'world_airports'

	serialize :arriving_location
	serialize :departing_location

	# assocations
	belongs_to :destination

	# scopes
	# default_scope { order(departing_at: :asc) }
	default_scope { where( "departing_at > ?", Time.now ).order(departing_at: :asc) }

	# class methods

	# instance methods

	# filters

	# validations

end
