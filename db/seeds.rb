# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MenuItem.create(href: "/destinations", icon: "globe", value: "Destinations")
MenuItem.create(href: "/casinos", icon: "building", value: "Casinos")
MenuItem.create(href: "/events", icon: "calendar", value: "On Lnad")
MenuItem.create(href: "/cruises", icon: "ship", value: "At Sea")
MenuItem.create(href: "/flights", icon: "plane", value: "Flights")