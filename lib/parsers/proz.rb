module Parsers
  class Proz
    FIELDS = %i[first_name last_name].freeze

    def initialize(doc)
      @doc = doc
    end

    def fetch_data
      FIELDS.map { |f| [f, send(f)] }.to_h
    end

    private

    # TODO: replace hardcoded values with parsed data from nokogiri
    def first_name
      'John'
    end

    def last_name
      'Doe'
    end
  end
end
