class CreativePhlEvents::Event

	attr_accessor :title, :description, :url, :tags, :venue, :cost, :date

	@@all = []

	def initialize(event_hash)
		event_hash.each {|k,v| self.send("#{k}=", v)}
		decode_date_entities
		save
	end

	def decode_date_entities
		@title = HTMLEntities.new.decode(self.title)
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
		puts ""
		# self.all.each.with_index(1) {|event, index| puts "#{index} - #{HTMLEntities.new.decode(event.title)}"}
		self.all.each.with_index(1) {|event, index| puts "#{index} - #{event.title}"}
		puts ""
	end

	def self.show_event_details(index)
		event = self.all[index]
		binding.pry
		puts ""
		puts event.title.upcase
		puts event.date
		puts event.description
		puts event.venue
		puts "Tags: #{event.tags.join(", ")}" 
	end

	def self.all
		@@all
	end

end