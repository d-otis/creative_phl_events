require "creative_phl_events/version"

require "nokogiri"
require "pry"
require "open-uri"
require "json"
require "HTTParty"
require "htmlentities"

require_relative 'creative_phl_events/cli'
require_relative 'creative_phl_events/scraper'
require_relative 'creative_phl_events/event'
require_relative 'creative_phl_events/tag'
