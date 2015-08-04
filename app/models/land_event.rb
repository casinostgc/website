class LandEvent < Event

	include DatetimeFormat
	datetime_vars start_var: :start_at, end_var: :end_at
	
end