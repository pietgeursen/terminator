require 'json'

CALLBACK_URL = "http://localhost:4567/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_CLIENT_ID']
  config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
end


get '/' do 
	erb :index
end

get '/colours' do

	client = Instagram.client(:access_token => session[:access_token])

	sunset_url = client.tag_recent_media('sunset')[0].images.thumbnail.url
	puts sunset_url

	response = Unirest.get "https://apicloud-colortag.p.mashape.com/tag-url.json",
	    headers:{
	      "X-Mashape-Key" => ENV['COLORTAG_MASHAPE_KEY'],
	      "Accept" => "application/json"
	    },
	    parameters:{
	    	:palette =>"precise", 
	    	:sort=>"weight", 
	    	:url=>sunset_url
	    }

	response.body.to_json

end