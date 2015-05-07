require 'nokogiri'
require 'open-uri'
require_relative 'homepage_API.rb'

class Youtube_vid
	attr_accessor :youtube_link, :youtube_html

	def initialize(song_name, artist_name)
		song_name = song_name.gsub(' ', '+').gsub("'", "%27")
		artist_name = artist_name.gsub(' ', '+').gsub("'", "%27")
		@youtube_link = "https://www.youtube.com/results?search_query=#{song_name}+#{artist_name}"
		@youtube_html = open(@youtube_link)
		@youtube_nokogiri = Nokogiri::HTML(@youtube_html)
	end

	def find_first_video_link
		@video_link_ending = youtube.css("a.yt-uix-tile-link.yt-ui-ellipsis.yt-ui-ellipsis-2.yt-uix-sessionlink.spf-link").map { |link| link['href'] }.first
		@video_link = "https://www.youtube.com#{@video_link_ending}"

	end
end