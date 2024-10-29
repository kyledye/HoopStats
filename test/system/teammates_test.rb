require "application_system_test_case"

class TeammatesTest < ApplicationSystemTestCase
  setup do
    @teammate = teammates(:one)
  end

  test "visiting the index" do
    visit teammates_url
    assert_selector "h1", text: "Teammates"
  end

  test "should create teammate" do
    visit teammates_url
    click_on "New teammate"

    click_on "Create Teammate"

    assert_text "Teammate was successfully created"
    click_on "Back"
  end

  test "should update Teammate" do
    visit teammate_url(@teammate)
    click_on "Edit this teammate", match: :first

    click_on "Update Teammate"

    assert_text "Teammate was successfully updated"
    click_on "Back"
  end

  test "should destroy Teammate" do
    visit teammate_url(@teammate)
    click_on "Destroy this teammate", match: :first

    assert_text "Teammate was successfully destroyed"
  end
end
