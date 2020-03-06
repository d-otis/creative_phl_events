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
				event_details
			when 'help'
				command_list
			end
			puts "Please enter another command, type 'help,' or 'exit' "
			puts ""
			input = gets.strip.downcase
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
		CreativePhlEvents::Event.show_event_details(index)
	end

	def command_list
		puts ""
		puts "-- Command List --"
		puts "titles - list event titles"
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