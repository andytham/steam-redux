# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
file = File.read "db/steam-apps-list.json"
json = JSON.parse(file)
list = json["applist"]["apps"]
formattedList = []
list.each do |item|
  formattedList << item
end

formattedList.each_with_index do |app,i|
  SteamApp.create!(appid: "#{formattedList[i]["appid"]}", name: "#{formattedList[i]["name"]}" )
end


puts "#{SteamApp.count} total apps created"
