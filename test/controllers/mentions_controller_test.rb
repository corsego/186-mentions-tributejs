require "test_helper"

class MentionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mention = mentions(:one)
  end

  test "should get index" do
    get mentions_url
    assert_response :success
  end

  test "should get new" do
    get new_mention_url
    assert_response :success
  end

  test "should create mention" do
    assert_difference("Mention.count") do
      post mentions_url, params: { mention: { message_id: @mention.message_id, user_id: @mention.user_id } }
    end

    assert_redirected_to mention_url(Mention.last)
  end

  test "should show mention" do
    get mention_url(@mention)
    assert_response :success
  end

  test "should get edit" do
    get edit_mention_url(@mention)
    assert_response :success
  end

  test "should update mention" do
    patch mention_url(@mention), params: { mention: { message_id: @mention.message_id, user_id: @mention.user_id } }
    assert_redirected_to mention_url(@mention)
  end

  test "should destroy mention" do
    assert_difference("Mention.count", -1) do
      delete mention_url(@mention)
    end

    assert_redirected_to mentions_url
  end
end
