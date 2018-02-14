class SteamUsersController < ApplicationController
  def index
    @apps = SteamApp.where(appid: 1..10)
    @exists = false
    if current_user
      #check if vanity
      if params[:search].length != 17 && !/\A\d+\z/.match(params[:search])
        find64 = RestClient::Request.execute(
          method: :get,
          url: "https://accesscontrolalloworiginall.herokuapp.com/https://api.steampowered.com/ISteamUser/ResolveVanityURL/v1?key=D973BBD110581F515815034E13E37B7C&vanityurl=#{params[:search]}"
        )
        puts "    "
        puts "     "
        puts "  fdsf  "
        if JSON.parse(find64)["response"]["message"] == "No match"
          @exists = false
        else
          @exists = true
          steamid = JSON.parse(find64)["response"]["steamid"]
        end
      else
        steamid = params[:search]
      end
      response = RestClient::Request.execute(
        method: :get,
        url:
        "https://accesscontrolalloworiginall.herokuapp.com/https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/?key=D973BBD110581F515815034E13E37B7C&steamids=#{steamid}"
      )
      puts "    "
      puts "     "
      puts "    "
      puts JSON.parse(response)["response"]
      if JSON.parse(response)["response"] != []
        @user = JSON.parse(response)["response"]["players"][0]
      end
    else
      redirect_to user_session_path
    end
  end

end
