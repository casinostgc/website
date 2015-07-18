class Picture < ActiveRecord::Base

	belongs_to :imageable, polymorphic: true

	attr_accessor :tmp_file, :tmp_gh_file

end
