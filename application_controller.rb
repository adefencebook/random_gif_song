require 'bundler'
Bundler.require
require_relative 'models/homepage_API.rb'
class ApplicationController < Sinatra::Base

  get '/' do
  	erb :homepage 
  end

  post '/results' do
  	genre = HomepageAPI.new(params["genre"])
	@tracks = genre.get_tracks
	erb :results_page
  end
end