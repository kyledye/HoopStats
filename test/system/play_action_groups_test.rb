require "application_system_test_case"

class PlayActionGroupsTest < ApplicationSystemTestCase
  setup do
    @play_action_group = play_action_groups(:one)
  end

  test "visiting the index" do
    visit play_action_groups_url
    assert_selector "h1", text: "Play action groups"
  end

  test "should create play action group" do
    visit play_action_groups_url
    click_on "New play action group"

    click_on "Create Play action group"

    assert_text "Play action group was successfully created"
    click_on "Back"
  end

  test "should update Play action group" do
    visit play_action_group_url(@play_action_group)
    click_on "Edit this play action group", match: :first

    click_on "Update Play action group"

    assert_text "Play action group was successfully updated"
    click_on "Back"
  end

  test "should destroy Play action group" do
    visit play_action_group_url(@play_action_group)
    click_on "Destroy this play action group", match: :first

    assert_text "Play action group was successfully destroyed"
  end
end
