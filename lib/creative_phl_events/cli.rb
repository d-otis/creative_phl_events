class CreativePhlEvents::CLI

	def start
		CreativePhlEvents::Scraper.new.scrape
		call
	end
	

	def call
		command_list
		input = gets.strip.downcase
		while input != "exit"
			case input
			when "titles"
				list_titles
			when 'help'
				command_list
			end
			puts "Please enter another command, type 'help,' or 'exit' "
			input = gets.strip.downcase
		end
	end

	def list_titles
		CreativePhlEvents::Event.list_titles
	end

	def command_list
		puts "titles - list event titles"
	end

end