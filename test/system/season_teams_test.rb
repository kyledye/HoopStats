require "application_system_test_case"

class SeasonTeamsTest < ApplicationSystemTestCase
  setup do
    @season_team = season_teams(:one)
  end

  test "visiting the index" do
    visit season_teams_url
    assert_selector "h1", text: "Season teams"
  end

  test "should create season team" do
    visit season_teams_url
    click_on "New season team"

    click_on "Create Season team"

    assert_text "Season team was successfully created"
    click_on "Back"
  end

  test "should update Season team" do
    visit season_team_url(@season_team)
    click_on "Edit this season team", match: :first

    click_on "Update Season team"

    assert_text "Season team was successfully updated"
    click_on "Back"
  end

  test "should destroy Season team" do
    visit season_team_url(@season_team)
    click_on "Destroy this season team", match: :first

    assert_text "Season team was successfully destroyed"
  end
end
