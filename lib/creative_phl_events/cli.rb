class CreativePhlEvents::CLI

	def start
		CreativePhlEvents::Scraper.new.scrape
		call
	end
	

	def call
		welcome
		command_list
		puts "Please enter a command:"
		puts ""
		input = gets.strip.downcase
		while input != "exit"
			case input
			when "titles"
				list_titles
				show_event_details
			when "tags"
				list_tags
				tag_details
			when "venues"
				list_venues
			when 'help'
				command_list
			end
			puts "Please enter another command, type 'help,' or 'exit' "
			puts ""
			input = gets.strip.downcase
		end
	end

	def list_venues
		CreativePhlEvents::Event.list_venues
	end

	def add_note_prompt(event)
		puts ""
		puts "Would you like to add a note?"
		puts ""
		input = gets.strip.downcase
		event.add_note if ['yes', 'y'].include?(input)
		puts ""
	end

	def tag_details
		puts ""
		puts "Select a tag number to see a list of events associated with it : "
		puts ""
		input = gets.strip.downcase.to_i
		index = input - 1
		if index >= 0
			CreativePhlEvents::Tag.detail_by_tag_index(index)
		else
			puts "Please enter a number greater than zero and no greater than #{CreativePhlEvents::Tag.all.size}"
			tag_details
		end
	end

	def list_titles
		CreativePhlEvents::Event.list_titles
	end

	def event_details
		puts "Do you want details?"
		puts ""
		input = gets.strip.downcase
		['y', 'yes'].include?(input) ? show_event_details : call
	end

	def show_event_details
		puts ""
		puts "Please enter # of event you're interested in : "
		puts ""
		input = gets.strip.downcase
		index = input.to_i - 1
		# CreativePhlEvents::Event.show_event_details(index)
		CreativePhlEvents::Event.show_event_details(CreativePhlEvents::Event.select_event(index))
		add_note_prompt(CreativePhlEvents::Event.select_event(index))
	end

	def list_tags
		CreativePhlEvents::Tag.list_tags
	end

	def command_list
		puts ""
		puts "-- Command List --"
		puts "titles - list event titles"
		puts "tags - list event tags"
		puts "venues - list event venues"
		puts "help - list commands"
		puts "exit - quit program"
		puts ""
	end

	def welcome
		puts ""
		puts "WELCOME TO CREATIVE PHL EVENTS CLI"
		puts "=================================="
	end

end