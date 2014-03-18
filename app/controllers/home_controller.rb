class HomeController < ApplicationController

require 'soundcloud'

def index
			
	if current_user
			@soundcloud_access_token = current_user.access_token 


			client = SoundCloud.new({
				  :client_id     => '0a5a8824df0c97aedb12448786a6f1de',
				  :client_secret => 'd57204e408d1cc467f403174788a2397',
				  :access_token      => @soundcloud_access_token
				})

			@sc = client.get('/me')
			@tracks = client.get('/me/tracks')
	end
	
end


def welcome

end

def upload

	require "omniauth-mixcloud"
	@title = params[:track]['title']
	@download_url = params[:track]['download_url']
	@download_url = "#{@download_url}?client_id=0a5a8824df0c97aedb12448786a6f1de" 

	require 'open-uri'
	require 'open_uri_redirections'
	require 'audioinfo'
	open('track.m4a', 'wb') do |file|
	  file << open(@download_url, :allow_redirections => :all).read
	  @file = file

	  AudioInfo.open(@file) do |info|
		  info.artist   # or info["artist"]
		  info.title    # or info["title"]
		  info.length   # playing time of the file
		  info.bitrate  # average bitrate
		  @info = info.to_h     # { "artist" => "artist", "title" => "title", etc... }
		  return @info
		end
	end
end

def mixcloud
	debugger

end



end