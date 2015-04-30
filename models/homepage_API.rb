require_relative 'song.rb'
class HomepageAPI
	attr_accessor :songs

	def initialize(genre)
		@genre = Echonest::Genre.new('S0XF9YS0UTCYEHQFQ', genre.downcase)
		@songs = []
		@videos = []
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
			@videos << Youtube_vid.new(song.song_name)
		end
		@videos
	end

end