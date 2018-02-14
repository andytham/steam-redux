class NewsController < ApplicationController
  def index
    @apps = Favorite.all
    @newsAll = []
    @appNames = []
    @objecttest = {}
    @apps.each do |app|
      response = RestClient::Request.execute(
        method: :get,
        url: "https://accesscontrolalloworiginall.herokuapp.com/https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=#{app.app}&count=3\r\n"
      )
      poop = JSON.parse(response)
      if poop != {}
        @objecttest[:app.name] 
        @newsAll << JSON.parse(response)["appnews"]["newsitems"][0]["contents"]
      end
    end
  end

end
