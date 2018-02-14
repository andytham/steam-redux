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

      if poop != {}
        @newsObj[:name] = app.name
        @newsObj[:content] = JSON.parse(response)["appnews"]["newsitems"][0]["contents"]
        @newsAll << @newsObj
        puts @newsObj
      end

    end
  end

end
