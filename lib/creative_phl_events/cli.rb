class CreativePhlEvents::CLI

	def start
		puts "hello world!"
		CreativePhlEvents::Scraper.new.scrape
	end

end