# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin::MenuItem.find_or_create_by(href: "/destinations", icon: "globe", text: "Destinations")
Admin::MenuItem.find_or_create_by(href: "/casinos", icon: "building", text: "Casinos")
Admin::MenuItem.find_or_create_by(href: "/events", icon: "calendar", text: "On Land")
Admin::MenuItem.find_or_create_by(href: "/cruises", icon: "ship", text: "At Sea")
Admin::MenuItem.find_or_create_by(href: "/flights", icon: "plane", text: "Flights")
