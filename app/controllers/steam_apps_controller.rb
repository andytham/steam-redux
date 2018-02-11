class SteamAppsController < ApplicationController
  def index
    @apps = SteamApp.where(appid: 1..50)

  end

end
