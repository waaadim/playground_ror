require 'nokogiri'
require 'open-uri'

module Parsers
  module Helpers
    module HttpHelpers
      def self.parse_url(url)
        Nokogiri::HTML(open(url))
      end
    end
  end
end
