class MenuItem < ActiveRecord::Base

	default_scope { order(position: :asc) }

	acts_as_list

	belongs_to :page

end
