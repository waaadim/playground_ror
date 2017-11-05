module TranslatorsHelper
  def build_translator_from_parsed_data(url)
    t = Translator.new
    parser = Parsers::UrlParser.new(url)

    data = parser.parsed_data
    t.first_name = data[:first_name]
    t.last_name = data[:last_name]
    t.source = url
    t.country = Country.find_by(name: data[:country])
    t.languages = Language.where(name: data[:languages])
    t
  end
end
