class SteamUsersController < ApplicationController
  def index
    @apps = SteamApp.where(appid: 1..10)
    if current_user
      #check if vanity
      if params[:search].length != 17 && !/\A\d+\z/.match(params[:search])
        find64 = RestClient::Request.execute(
          method: :get,
          url: "https://accesscontrolalloworiginall.herokuapp.com/https://api.steampowered.com/ISteamUser/ResolveVanityURL/v1?key=D973BBD110581F515815034E13E37B7C&vanityurl=#{params[:search]}"
        )
        steamid = JSON.parse(find64)["response"]["steamid"]
      else
        steamid = params[:search]
      end
      response = RestClient::Request.execute(
        method: :get,
        url:
        "https://accesscontrolalloworiginall.herokuapp.com/https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/?key=D973BBD110581F515815034E13E37B7C&steamids=#{steamid}"
      )
      @user = JSON.parse(response)["response"]["players"][0]
    else
      redirect_to user_session_path
    end
  end

end
