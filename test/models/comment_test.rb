require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without commenter or comment" do
    article = Article.new(title: '123456')
    article.save
    comment = Comment.new(article_id: article.id)
    assert_not comment.save
    comment.commenter = "PHP Lover"
    assert_not comment.save
    comment.commenter = nil
    comment.body = "PHP rulez!"
    assert_not comment.save
  end

  test "save comment to article" do
    article = Article.new(title: '123456')
    article.save
    comment = Comment.new(commenter: "A beloved Ruby User", body: "Ruby rules!!!!", article_id: article.id)
    assert comment.save
  end
end
