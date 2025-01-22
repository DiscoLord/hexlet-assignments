require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = post_comments(:one)
  end

  test "should create comment" do
    assert_difference('PostComment.count') do
      post post_comments_url(@post), params: { post_comment: { content: 'New Comment' } }
    end
    assert_redirected_to post_url(@post)
  end

  test "should not create invalid comment" do
    assert_no_difference('PostComment.count') do
      post post_comments_url(@post), params: { post_comment: { content: '' } }
    end
  end

  test "should edit comment" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { post_comment: { content: 'Updated Comment' } }
    assert_redirected_to posts_url
    @comment.reload
    assert_equal 'Updated Comment', @comment.content
  end

  test "should destroy comment" do
    assert_difference('PostComment.count', -1) do
      delete comment_url(@comment)
    end
    assert_redirected_to posts_url
  end
end

