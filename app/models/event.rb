class Event < ActiveRecord::Base

	include DatetimeFormat
	datetime_vars start_var: :start_at, end_var: :end_at

	include Content
	include Imageable

	default_scope { includes(:casino).order(start_at: :asc) }

	scope :future, -> { where("start_at > ?", Time.now ) }

	belongs_to :casino

	validates :casino_id, :start_at, :end_at, presence: true

	def date_span
		self.start_at.strftime("%b %d, %Y") + ' - ' + self.end_at.strftime("%b %d, %Y")
	end

	def icon
		'calendar'
	end

end
