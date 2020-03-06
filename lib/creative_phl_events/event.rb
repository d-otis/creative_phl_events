class CreativePhlEvents::Event

	attr_accessor :title, :description, :url, :tags, :venue, :cost, :date

	@@all = []

	def initialize(event_hash)
		event_hash.each {|k,v| self.send("#{k}=", v)}
		save
	end

	def save
		@@all << self
	end

	def self.create_from_arr_of_hashes(arr)
		arr.each do |event_hash|
			new_event = self.new(event_hash)
		end
	end

	def self.list_titles
		self.all.each.with_index(1) {|event, index| puts "#{index} - #{Nokogiri::HTML.parse(event.title)}"}
	end

	def self.all
		@@all
	end

end