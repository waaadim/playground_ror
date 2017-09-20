require 'test_helper'

class PosterTest < ActiveSupport::TestCase
  setup do
    @poster = Poster.new
  end

  test 'Fails when person and federal_legislator are missing' do
    assert_not @poster.valid?
  end

  test 'Fails when has multiple posters' do
    @poster.person = persons(:joe)
    @poster.federal_legislator = federal_legislators(:fele1)
    assert_not @poster.valid?
  end

  test 'Can create with only person' do
    @poster.person = persons(:joe)
    assert @poster.valid?
  end

  test 'Can create with only federal_legislator' do
    @poster.federal_legislator = federal_legislators(:fele1)
    assert @poster.valid?
  end
end
