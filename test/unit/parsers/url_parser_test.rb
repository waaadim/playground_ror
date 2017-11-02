require 'test_helper'

class UrlParserTest < ActiveSupport::TestCase
  setup do
    @up = Parsers::UrlParser.new('https://www.proz.com/profile/52171')
  end

  test 'Invalid whithout poster' do
    p = @up.send(:parser)
    assert_equal p.to_s.demodulize, 'Proz'
  end
end
