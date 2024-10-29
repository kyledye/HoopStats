require "application_system_test_case"

class ShotTypesTest < ApplicationSystemTestCase
  setup do
    @shot_type = shot_types(:one)
  end

  test "visiting the index" do
    visit shot_types_url
    assert_selector "h1", text: "Shot types"
  end

  test "should create shot type" do
    visit shot_types_url
    click_on "New shot type"

    click_on "Create Shot type"

    assert_text "Shot type was successfully created"
    click_on "Back"
  end

  test "should update Shot type" do
    visit shot_type_url(@shot_type)
    click_on "Edit this shot type", match: :first

    click_on "Update Shot type"

    assert_text "Shot type was successfully updated"
    click_on "Back"
  end

  test "should destroy Shot type" do
    visit shot_type_url(@shot_type)
    click_on "Destroy this shot type", match: :first

    assert_text "Shot type was successfully destroyed"
  end
end
