require 'test_helper'

class PersonGroupsPosterTest < ActiveSupport::TestCase
  setup do
    @pgp = PersonGroupsPoster.new
    @pgp.poster = posters(:poster1)
    @pgp.person_group = person_groups(:politicians)
  end

  test 'Invalid whithout poster' do
    @pgp.poster = nil
    assert_not @pgp.valid?
  end

  test 'Invalid whithout person_group' do
    @pgp.person_group = nil
    assert_not @pgp.valid?
  end

  test 'Invalid when poster already in group' do
    assert_not @pgp.valid?
  end

  test 'Can create model' do
    @pgp.poster = posters(:poster3)
    assert @pgp.valid?
  end
end
