class CreativePhlEvents::Scraper

	def scrape

		# title = event['title']
		# description = event['description']
		# date = event['date']
		# cost = event['cost']
		# url = event['url']
		# tags = event['tags'] needs to be iterated through to make an array of strings for each cat
		# venue = event['venue']['venue']

		# doc = Nokogiri::HTML(open('https://creativephl.org/wp-json/tribe/events/v1/events'))
		doc = HTTParty.get('https://creativephl.org/wp-json/tribe/events/v1/events')
		events_array = doc['events'].collect do |event|
			event_hash = {
				:title => event['title'],
				:description => event['description'],
				:date => event['date'],
				:cost => event['cost'],
				:url => event['url'],
				:venue => event['venue']['venue'],
				:tags => event['tags'].collect {|tag| tag['name']}
			}
		end
		CreativePhlEvents::Event.create_from_arr_of_hashes(events_array)
	end


end