require 'json'

get '/' do 
	erb :index
end

get '/colours' do

	#get instagram links by tag.


	  # These code snippets use an open-source library. http://unirest.io/ruby
	  response = Unirest.get "https://apicloud-colortag.p.mashape.com/tag-url.json",
	    headers:{
	      "X-Mashape-Key" => ENV['COLORTAG_MASHAPE_KEY'],
	      "Accept" => "application/json"
	    },
	    parameters:{:palette =>"precise", :sort=>"weight", :url=>"https://awesomewallpapers.files.wordpress.com/2014/01/triforce.jpg"}

	response.body.to_json

end