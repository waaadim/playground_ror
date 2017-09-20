require 'test_helper'

class SocialNetworkTest < ActiveSupport::TestCase
  setup do
    @sn = SocialNetwork.new
  end

  test 'Invalid whithout name' do
    @sn.name = ''
    assert_not @sn.valid?
  end

  test 'Can create model' do
    @sn.name = 'something'
    assert @sn.valid?
  end
end
