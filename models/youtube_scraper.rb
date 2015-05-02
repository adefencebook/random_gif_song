# require 'nokogiri'
# require 'open-uri'
# require_relative 'homepage_API.rb'

# class Youtube_vid
# 	attr_accessor :youtube_link, :youtube_html

# 	def initialize(song_name)
# 		fixed_name = song_name.gsub(' ', '+').gsub("'", "%27")
# 		@youtube_link = "https://www.youtube.com/results?search_query=#{fixed_name}"
# 		@youtube_html = open(@youtube_link)
# 	end

# 	def create_nokogiri
# 		@youtube_nokogiri = Nokogiri::HTML(@youtube_html)
# 	end

# end