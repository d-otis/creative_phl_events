class CreativePhlEvents::Tag
	attr_accessor :name, :events

	@@all = []

	def initialize
		save
		@events = []
	end

	def self.find_or_create_by_tag(tag, event)
		if self.all.find {|tag_instance| tag_instance.name == tag}
			self.all.find {|tag_instance| tag_instance.name == tag}.events << event
			self.all.find {|tag_instance| tag_instance.name == tag}
		else
			new_tag = self.new
			new_tag.name = tag
			new_tag.events << event
			new_tag
		end
	end

	def self.sorted_tags
		self.all.sort_by(&:name)
	end

	def self.list_tags
		puts ""
		puts "List of Tags in Alphabetical Order"
		puts "==============================="
		# self.all.sort_by(&:name).each.with_index(1) {|tag, index| puts "#{index}. #{tag.name}"}
		self.sorted_tags.each.with_index(1) {|tag, index| puts "#{index}. #{tag.name}"}
		puts ""
	end

	def self.detail_by_tag_index(index)
		unique_events_arr = sorted_tags[index].events.collect {|event| event.title}.uniq
		puts ""
		puts "#{sorted_tags[index].name} Events :"
		unique_events_arr.each.with_index(1) {|event, index| puts "#{index}. #{event}"}
		puts ""
		puts "Select event by # for details : "
		input = gets.strip.downcase.to_i
		index = input - 1
		CreativePhlEvents::Event.find_by_title(unique_events_arr[index])
	end

	def save
		@@all << self
	end

	def self.all
		@@all
	end

end