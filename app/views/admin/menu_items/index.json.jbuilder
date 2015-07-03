json.array!(@admin_menu_items) do |admin_menu_item|
  json.extract! admin_menu_item, :id, :href, :icon, :position, :text, :page_id, :blank_target
  json.url admin_menu_item_url(admin_menu_item, format: :json)
end
