require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @a = Article.new
    @a.attributes = articles(:article_one).attributes
  end

  test 'Invalid whithout publish date' do
    @a.publish_date = nil
    assert_not @a.valid?
  end

  test 'Invalid whithout poster' do
    @a.poster = nil
    assert_not @a.valid?
  end

  test 'Can create model' do
    assert @a.valid?
  end

  test 'Clients relation' do
    assert_equal Article.with_clients(clients(:google).id).count, 1
  end
end
