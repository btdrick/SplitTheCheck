require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    @restaurant = restaurants(:one)
    sign_in @comment.user
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post restaurant_comments_path(@restaurant), params:
      { comment:
        { restaurant_id: @restaurant.id,
          content: @comment.content } }
    end

    assert_redirected_to restaurant_url(@restaurant)
  end
  
end
