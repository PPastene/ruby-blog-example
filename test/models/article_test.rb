require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article with no or short title" do
    article = Article.new
    assert_not article.save
    article.title = '123'
    assert_not article.save
  end

  test "save article" do
    article = Article.new(title: '123456')
    assert article.save
  end
end
