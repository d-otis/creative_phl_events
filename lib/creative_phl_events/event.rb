class CreativePhlEvents::Event

	attr_accessor :title, :description, :url, :tags, :venue, :cost, :date, :notes

	@@all = []

	def initialize(event_hash)
		# event_hash.each {|k,v| self.send("#{k}=", v)}
		event_hash.each do |k, v|
			if k == :tags
				v.each {|tag| CreativePhlEvents::Tag.find_or_create_by_tag(tag, self)}
			else
				event_hash.each {|k,v| self.send("#{k}=", v)}
			end
		end
		decode_title_entities
		parse_description
		@notes = []
		save
	end

	def decode_title_entities
		@title = HTMLEntities.new.decode(self.title)
	end

	def parse_description
		@description = Nokogiri::HTML(self.description).text
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
		self.all.each.with_index(1) {|event, index| puts "#{index} - #{event.title} - #{event.date.split(" ")[0]}"}
		puts ""
	end

	def self.select_event(index)
		self.all[index]
	end

	def self.show_event_details(event)
		# event = self.all[index]
		puts ""
		puts "============================================="
		puts event.title.upcase
		puts ""
		puts event.date
		puts ""
		puts event.description
		puts ""
		puts "Venue: #{event.venue}" if event.venue
		puts "Tags: #{event.tags.join(", ")}"
		puts "" if !event.notes.empty?
		puts "Notes: #{event.notes.join(" // ")}" if !event.notes.empty?
		puts "============================================="
		puts ""
	end

	def self.find_by_title(title)
		self.show_event_details(CreativePhlEvents::Event.all.find {|event| event.title == title})
	end

	def add_note
		puts ""
		puts "Add note "
		# list_titles
		self.notes << gets.strip
	end

	def self.all
		@@all
	end

end