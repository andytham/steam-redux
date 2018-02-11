require 'json'
file = File.read "db/steam-apps-list.json"
# require_relative "steam-apps-list.json"

json = JSON.parse(file)

list = json["applist"]["apps"]

formattedList = []

list.each do |item|
  formattedList << item
end

p formattedList[0]["name"]
