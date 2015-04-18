class HomepageAPI
	def initialize(genre)
		@client = Soundcloud.new(:client_id => '5248c565d4dbf79c9f59271299fd4302')
		@genre = genre
	end

	def get_tracks
		@client.get('/tracks', :genres => @genre, :limit => 5)
	end
end

