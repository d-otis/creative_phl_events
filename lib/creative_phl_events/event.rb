class CreativePhlEvents::Event

	attr_accessor :title, :description, :url, :tags, :venue, :cost, :date

	@@all = []

	def initialize
		save
	end

	def save
		@@all << self
	end

	def self.create_from_arr_of_hashes(arr)
		binding.pry
	end

	def self.all
		@@all
	end

end