require_relative 'song.rb'
require_relative 'youtube_scraper.rb'

class HomepageAPI
	attr_accessor :songs, :videos, :what_is_genre

	def initialize(genre)
		@what_is_genre = genre
		@genre = Echonest::Genre.new('S0XF9YS0UTCYEHQFQ', genre.downcase)
		@artists = []
		@names = []
		@songs = []
		@videos = []
		@sim_genres = []
		@both = {
			:a => {
				:song => nil,
				:video => nil,
				},
			:b => {
				:song => nil,
				:video => nil,
				},
			:c => {
				:song => nil,
				:video => nil,
				},
			:d => {
				:song => nil,
				:video => nil,
				},
			:e => {
				:song => nil,
				:video => nil,
			}
		}
	end

	def get_random_artists
		@artists = @genre.artists[:artists].sample(5)
	end

	def list_artist_names
		@names =  @artists.collect do |artist| 
			artist[:name]
		end
	end

	def create_song_object
		self.get_random_artists
		self.list_artist_names
		@names.each do |name|
			@songs << Song.new(name)
		end
		@songs
	end

	def find_youtube_vid
		@songs.each do |song|
			@videos << Youtube_vid.new(song.song_name, song.artist_name)
		end
		@videos
	end

	def song_video_hash
		x = 0
		self.create_song_object
		self.find_youtube_vid
		@both.each_value do |hash|
			if x < 5
				hash[:song] = @songs[x]
				hash[:video] = @videos[x]
				x += 1
			end
		end
	end

	def find_similar_genres
		@similars = @genre.similar[:genres]
		@similars.each do |genre|
			@sim_genres << genre[:name]
		end

	end

end