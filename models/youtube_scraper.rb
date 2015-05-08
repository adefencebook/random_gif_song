require 'open-uri'
require_relative 'homepage_API.rb'

class Youtube_vid
	attr_accessor :youtube_link, :youtube_html, :video_watch_code

	def initialize(song_name, artist_name)
		song_name = song_name.gsub(' ', '+').gsub("'", "%27")
		artist_name = artist_name.gsub(' ', '+').gsub("'", "%27")
		@youtube_link = "https://www.youtube.com/results?search_query=#{song_name}+#{artist_name}"
		@youtube_html = open(@youtube_link)
		@youtube_nokogiri = Nokogiri::HTML(open(@youtube_link))
	end

	def find_video_embed_code
		@video_link_ending = youtube.css("a.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2.yt-uix-sessionlink.spf-link").map { |link| link['href'] }.first
		@video_watch_code = @video_link_ending.gsub("/watch?v=", "")
		@video_embed_code = '<iframe width="420" height="315" src="https://www.youtube.com/embed/#{@video_watch_code}" frameborder="0" allowfullscreen></iframe>'
	end
end