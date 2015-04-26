class HomepageAPI
	def initialize(genre)
		
		@genre = genre
	end

	def get_tracks
		@client.get('/tracks', :genres => @genre, :limit => 5)
	end
end

