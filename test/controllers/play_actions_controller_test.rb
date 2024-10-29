require "test_helper"

class PlayActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @play_action = play_actions(:one)
  end

  test "should get index" do
    get play_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_play_action_url
    assert_response :success
  end

  test "should create play_action" do
    assert_difference("PlayAction.count") do
      post play_actions_url, params: { play_action: {  } }
    end

    assert_redirected_to play_action_url(PlayAction.last)
  end

  test "should show play_action" do
    get play_action_url(@play_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_play_action_url(@play_action)
    assert_response :success
  end

  test "should update play_action" do
    patch play_action_url(@play_action), params: { play_action: {  } }
    assert_redirected_to play_action_url(@play_action)
  end

  test "should destroy play_action" do
    assert_difference("PlayAction.count", -1) do
      delete play_action_url(@play_action)
    end

    assert_redirected_to play_actions_url
  end
end
