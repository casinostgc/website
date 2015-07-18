module GithubMediaUploader
	extend ActiveSupport::Concern

	included do
		attr_accessor :tmp_file, :tmp_gh_file

		scope :destroy_all_without_db_record, -> { self.where.not(gh_name: self.gh_filenames).destroy_all }

		after_create :gh_create, unless: -> { self.tmp_gh_file }
		# after_update :gh_update
		before_destroy :gh_delete
	end

	module ClassMethods

		# def gh_test
		# end

		def gh_client
			client = Octokit::Client.new(login: 'casinos@kaymic.com', password: ENV["GITHUB_PASSWORD"])
		end

		def gh_repo
			'CasinosTGC/media'
		end

		def gh_media_path
			''
		end

		def gh_repo_media_url
			url = "http://casinostgc.github.io/media/"
			url += "#{self.gh_media_path}/" unless self.gh_media_path.blank?
			url
		end

		def gh_media_files
			self.gh_client.contents self.gh_repo, path: self.gh_media_path
		rescue
			[]
		end

		def gh_filenames
			self.gh_media_files.map(&:name)
		end

		def gh_create_gh_files_without_records
			self.gh_media_files.each do |gh_file|
				unless self.all.map(&:gh_name).include?(gh_file.name) || gh_file.name.nil?
					self.create gh_name: gh_file.name, gh_url: gh_file.download_url,  title: gh_file.name, tmp_gh_file: true
				end
			end
		end

	end

	def gh_media_url
		self.class.gh_repo_media_url + self.gh_name
	end

	def gh_create
		filename = "#{Time.now.to_i}-#{self.tmp_file.original_filename}"
		message ||= "Created #{filename}"
		file = self.class.gh_client.create_contents(self.class.gh_repo, "#{self.class.gh_media_path}/#{filename}", message, file: self.tmp_file.tempfile)
		self.update_columns(gh_name: file.content.name, gh_url: file.content.download_url)
		self.update_columns(title: file.content.name) if self.title.blank?
	end

	def gh_delete
		gh_file = self.class.gh_client.contents(self.class.gh_repo, path: "#{self.class.gh_media_path}/#{gh_name}")
		file = self.class.gh_client.delete_contents(self.class.gh_repo, gh_file.path, "Delete #{gh_file.name}", gh_file.sha)
	end

	def delete_gh_file(gh_file)
		deleted_file = self.class.gh_client.delete_contents(self.class.gh_repo, gh_file.path, "Delete #{gh_file.name}", gh_file.sha)
	end

	def file_type
		File.extname(URI.parse(self.gh_media_url).path)
	end

	# private

	# def gh_update
	# 	gh_file = self.class.gh_client.contents(self.class.gh_repo, path: "media/#{gh_file.name}")
	# 	file = self.class.gh_client.update_contents(self.class.gh_repo, "media/#{title.parameterize}", description, gh_file.sha, 'updated test from')
	# end

end