require "test_helper"

class PlayActionGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @play_action_group = play_action_groups(:one)
  end

  test "should get index" do
    get play_action_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_play_action_group_url
    assert_response :success
  end

  test "should create play_action_group" do
    assert_difference("PlayActionGroup.count") do
      post play_action_groups_url, params: { play_action_group: {  } }
    end

    assert_redirected_to play_action_group_url(PlayActionGroup.last)
  end

  test "should show play_action_group" do
    get play_action_group_url(@play_action_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_play_action_group_url(@play_action_group)
    assert_response :success
  end

  test "should update play_action_group" do
    patch play_action_group_url(@play_action_group), params: { play_action_group: {  } }
    assert_redirected_to play_action_group_url(@play_action_group)
  end

  test "should destroy play_action_group" do
    assert_difference("PlayActionGroup.count", -1) do
      delete play_action_group_url(@play_action_group)
    end

    assert_redirected_to play_action_groups_url
  end
end
