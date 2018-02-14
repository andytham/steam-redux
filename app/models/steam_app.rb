class SteamApp < ApplicationRecord
  attr_accessor :name, :appid
  belongs_to :user
  scoped_search on: [:name, :appid]
  # default_operator overrides LIKE
  scoped_search on: :appid, profile: :appid, default_operator: :eq
end
