require "application_system_test_case"

class FoulsTest < ApplicationSystemTestCase
  setup do
    @foul = fouls(:one)
  end

  test "visiting the index" do
    visit fouls_url
    assert_selector "h1", text: "Fouls"
  end

  test "should create foul" do
    visit fouls_url
    click_on "New foul"

    click_on "Create Foul"

    assert_text "Foul was successfully created"
    click_on "Back"
  end

  test "should update Foul" do
    visit foul_url(@foul)
    click_on "Edit this foul", match: :first

    click_on "Update Foul"

    assert_text "Foul was successfully updated"
    click_on "Back"
  end

  test "should destroy Foul" do
    visit foul_url(@foul)
    click_on "Destroy this foul", match: :first

    assert_text "Foul was successfully destroyed"
  end
end
