class SteamApp < ApplicationRecord
  attr_accessor :name, :appid
  scoped_search on: [:name, :appid]
end
