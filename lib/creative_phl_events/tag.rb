class CreativePhlEvents::Tag
	attr_accessor :name, :events

	@@all = []

	def initialize
		save
		@events = []
	end

	def find_or_create_by_tag(tag, event)
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

	def save
		self.all << self
	end

	def self.all
		@@all
	end

end