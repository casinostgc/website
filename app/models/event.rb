class Event < ActiveRecord::Base

	include DatetimeFormat
	datetime_vars start_var: :start_at, end_var: :end_at

	include Content
	include Imageable

	default_scope { includes(:casino).where("start_at > ?", Date.today ).order(start_at: :asc) }

	belongs_to :casino

	validates :casino_id, presence: true

	def date_span
		self.start_at.strftime("%b %d, %Y") + ' - ' + self.end_at.strftime("%b %d, %Y")
	end

	def icon
		'calendar'
	end

end
