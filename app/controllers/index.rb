require 'json'

CALLBACK_URL = "http://localhost:4567/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_CLIENT_ID']
  config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end


get '/' do 
	erb :index
end

get '/colours' do

	#get instagram links by tag.
	client = Instagram.client(:access_token => session[:access_token])
	tags = client.tag_search('cat')
	puts tags



	  # These code snippets use an open-source library. http://unirest.io/ruby
	#   response = Unirest.get "https://apicloud-colortag.p.mashape.com/tag-url.json",
	#     headers:{
	#       "X-Mashape-Key" => ENV['COLORTAG_MASHAPE_KEY'],
	#       "Accept" => "application/json"
	#     },
	#     parameters:{:palette =>"precise", :sort=>"weight", :url=>"https://awesomewallpapers.files.wordpress.com/2014/01/triforce.jpg"}

	# response.body.to_json

end