require 'test_helper'

class ProzTest < ActiveSupport::TestCase
  setup do
    # TODO: mock this bugger
    doc = Parsers::Helpers::HttpHelpers.parse_url('https://www.proz.com/profile/52171')

    @p = Parsers::Proz.new(doc)
  end

  test 'Invalid whithout poster' do
    data = @p.fetch_data
    assert_equal data[:first_name], 'John'
    assert_equal data[:last_name], 'Doe'
  end
end
