require 'test_helper'

class ClientsPersonGroupTest < ActiveSupport::TestCase
  setup do
    @cpg = ClientsPersonGroup.new
    @cpg.client = clients(:google)
    @cpg.person_group = person_groups(:politicians)
  end

  test 'Invalid whithout client' do
    @cpg.client = nil
    assert_not @cpg.valid?
  end

  test 'Invalid whithout person_group' do
    @cpg.person_group = nil
    assert_not @cpg.valid?
  end

  test 'Invalid when client already has group' do
    assert_not @cpg.valid?
  end

  test 'Can create model' do
    @cpg.person_group = person_groups(:dudes)
    assert @cpg.valid?
  end
end
