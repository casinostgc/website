class CruiseList < ActiveRecord::Base

	include Content

	belongs_to :venue

	has_many :cruise_list_dates, dependent: :destroy
	has_many :cruise_list_ports, dependent: :destroy
	has_many :ports, through: :cruise_list_ports

	accepts_nested_attributes_for :cruise_list_dates, allow_destroy: true
	accepts_nested_attributes_for :cruise_list_ports, allow_destroy: true

	# default_scope { order(start_at: :asc) }

	scope :has_image, -> { joins(ports: :pictures).distinct }

	# validations
	validates :venue_id, presence: true
	validates :cruise_list_ports, length: { minimum: 2, message: "requires %{count} or more. Go back to add more." }
	validates_associated :cruise_list_ports, message: 'are invalid. Go back to edit.'

	def pictures
		pics = Picture.where(imageable: self.ports)
		pics.order(reorder_pictures) unless pics.nil?
	end

	def reorder_pictures
		mod_port_ids = self.cruise_list_ports.drop(1).map{ |p| p.port.pictures.any? ? p.port.pictures.first.id : 0 }
		out = "CASE"
		mod_port_ids.each_with_index do |id, i|
			out << " WHEN id = #{id} THEN #{i}"
		end
		out << " END"
	end

end
