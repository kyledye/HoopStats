require "application_system_test_case"

class ShotGradesTest < ApplicationSystemTestCase
  setup do
    @shot_grade = shot_grades(:one)
  end

  test "visiting the index" do
    visit shot_grades_url
    assert_selector "h1", text: "Shot grades"
  end

  test "should create shot grade" do
    visit shot_grades_url
    click_on "New shot grade"

    click_on "Create Shot grade"

    assert_text "Shot grade was successfully created"
    click_on "Back"
  end

  test "should update Shot grade" do
    visit shot_grade_url(@shot_grade)
    click_on "Edit this shot grade", match: :first

    click_on "Update Shot grade"

    assert_text "Shot grade was successfully updated"
    click_on "Back"
  end

  test "should destroy Shot grade" do
    visit shot_grade_url(@shot_grade)
    click_on "Destroy this shot grade", match: :first

    assert_text "Shot grade was successfully destroyed"
  end
end
