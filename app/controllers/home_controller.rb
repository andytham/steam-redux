class HomeController < ApplicationController
  def index
    p "hello world"
    @string = "test string"
    response = RestClient::Request.execute(
      method: :get,
      url: 'http://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=440&count=3\r\n'
    )
    @data = JSON.parse(response)["appnews"]["newsitems"][0]["contents"]
  end

end
