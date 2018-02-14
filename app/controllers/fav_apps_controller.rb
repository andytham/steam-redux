class FavAppsController < ApplicationController
  def index
    if current_user
      @favApps = Favorite.where(user_id: current_user.id)
    else
      redirect_to user_session_path
    end


  end

  def show
    @favApps = Favorite.all
    @favApp = Favorite.find(params[:id])
  end

  def destroy
    Favorite.destroy(params[:id])
    redirect_to action: "index"
  end
end
