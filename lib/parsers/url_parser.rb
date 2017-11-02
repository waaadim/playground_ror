module Parsers
  class UrlParser
    def initialize(url)
      @url = url
    end

    def parsed_data
      doc = Parsers::Helpers::HttpHelpers.parse_url(@url)
      p = parser.new(doc)
      p.fetch_data
    end

    private

    def parser
      parser_class_name = @url.split('.')[1].classify
      Parsers.const_get(parser_class_name)
    end
  end
end
