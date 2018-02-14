class NewsController < ApplicationController
  def index
    @apps = Favorite.all
    @newsAll = []
    @appNames = []
    @newsObj = {}

    @apps.each do |app|
      response = RestClient::Request.execute(
        method: :get,
        url: "https://accesscontrolalloworiginall.herokuapp.com/https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=#{app.appid}&count=3\r\n"
      )
      poop = JSON.parse(response)
      if poop != {} && poop["appnews"]["count"] != 0
        @newsObj[:name] = app.name
        @newsObj[:content] = JSON.parse(response)["appnews"]["newsitems"][0]["contents"]
        # need to shallow copy with clone or mutating the obj will mess with the array's clone as it points to the object
        @newsAll << @newsObj.clone
        @newsObj.clear

      end

    end

  end

end
