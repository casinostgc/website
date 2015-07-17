module Admin::SharedHelper

	def item_path(item, item_type)
		send("#{item_type}_path", item)
	rescue
		'#'
	end

end