# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Event.destroy_all
User.destroy_all

puts 'creating user'

laura = User.create(email: 'laura@gmail.com', password: '123456')

puts 'creating events'

cleaning = Event.create!(title: "Cleaning Treptower Park", description: "There is so much trash", address: "Treptower Park", neighbourhood: "Treptower", category: "Sustainability", start_time: "7PM")
feeding = Event.create!(title: "Feeding the homeless at Alex", description: "Soups for everyone", address: "Alexanderplatz", neighbourhood: "Mitte", category: "Charity", start_time: "7PM")
