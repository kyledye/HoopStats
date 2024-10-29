require "application_system_test_case"

class PlayActionsTest < ApplicationSystemTestCase
  setup do
    @play_action = play_actions(:one)
  end

  test "visiting the index" do
    visit play_actions_url
    assert_selector "h1", text: "Play actions"
  end

  test "should create play action" do
    visit play_actions_url
    click_on "New play action"

    click_on "Create Play action"

    assert_text "Play action was successfully created"
    click_on "Back"
  end

  test "should update Play action" do
    visit play_action_url(@play_action)
    click_on "Edit this play action", match: :first

    click_on "Update Play action"

    assert_text "Play action was successfully updated"
    click_on "Back"
  end

  test "should destroy Play action" do
    visit play_action_url(@play_action)
    click_on "Destroy this play action", match: :first

    assert_text "Play action was successfully destroyed"
  end
end
