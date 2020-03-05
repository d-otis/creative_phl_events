class CreativePhlEvents::Scraper

	def scrape

		doc = Nokogiri::HTML(open('https://creativephl.org/wp-json/tribe/events/v1/events'))
		binding.pry


	end


end