require 'bundler'
Bundler.require
require_relative 'models/homepage_API.rb'
require_relative 'models/song.rb'
class ApplicationController < Sinatra::Base

  get '/' do
  	erb :homepage 
  end

  post '/results' do
	results = HomepageAPI.new(params["genre"])
	@songs = results.create_song_object
	erb :results_page
  end
end