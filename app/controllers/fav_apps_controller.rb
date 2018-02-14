class FavAppsController < ApplicationController
  def index
    @favApps = Favorite.all
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
