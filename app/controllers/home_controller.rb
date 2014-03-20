class HomeController < ApplicationController

require 'soundcloud'

def index
			
	if current_user
		if current_user.provider == 'soundcloud'
		  @soundcloud_access_token = current_user.access_token 

			 if @soundcloud_access_token != nil

				client = Soundcloud.new({
					  :client_id     => '0a5a8824df0c97aedb12448786a6f1de',
					  :client_secret => 'd57204e408d1cc467f403174788a2397',
					  :access_token      => @soundcloud_access_token
					})

				@sc = client.get('/me')
				@tracks = client.get('/me/tracks')
			end
		end
		@mixcloud_access_token = current_user.mixcloud_access_token 
	end
	
end


def welcome

end

def upload

	@mixcloud_access_token = current_user.mixcloud_access_token 
	@title = params[:track]['title']
	@download_url = params[:track]['download_url']
	@download_url = "#{@download_url}?client_id=0a5a8824df0c97aedb12448786a6f1de" 
	@mp4 = URI.parse(@download_url)


	require 'open-uri'
	require 'open_uri_redirections'
	require 'audioinfo'
	require 'mp4info'

	require 'open-uri'

	open("track", "wb") do |file|
	  open(@download_url, :allow_redirections => :all) do |uri|
	     @file = file.write(uri.read)
	  end
	end


	# open('track.m4a', 'wb') do |file|
	#   file << open(@download_url, :allow_redirections => :all )  {|f| f.read }
	#   @file = file

	#   @mp4 = MP4Info.open(file)

	#   # AudioInfo.open(@file) do |info|
	# 	 #  info.artist   # or info["artist"]
	# 	 #  info.title    # or info["title"]
	# 	 #  info.length   # playing time of the file
	# 	 #  info.bitrate  # average bitrate
	# 	 #  @info = info.to_h     # { "artist" => "artist", "title" => "title", etc... }
	#   # end


	# end
 	
	# require 'json'
	# require 'open-uri'
	# @result = open(@download_url, :allow_redirections => :all).read


	# @result  = open(@download_url, :allow_redirections => :all) {|f| f.read }

	#  AudioInfo.open(@result) do |info|
	# 	  info.artist   # or info["artist"]
	# 	  info.title    # or info["title"]
	# 	  info.length   # playing time of the file
	# 	  info.bitrate  # average bitrate
	# 	  @info = info.to_h     # { "artist" => "artist", "title" => "title", etc... }
	#   end

end


def successs

end





end