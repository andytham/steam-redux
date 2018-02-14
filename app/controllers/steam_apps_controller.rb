class SteamAppsController < ApplicationController
  def index
    @apps = SteamApp.where(appid: 1..50)
    if current_user
      puts "hello"
    else
      redirect_to user_session_path
    end
  end

  def create
    Favorite.find_or_create_by(user_id: params[:user_id], appid: params[:appid], name: params[:name])
  end

end
