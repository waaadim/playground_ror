require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  setup do
    @c = Client.new
  end

  test 'Invalid whithout name' do
    @c.name = ''
    assert_not @c.valid?
  end

  test 'Can create model' do
    @c.name = 'something'
    assert @c.valid?
  end
end
