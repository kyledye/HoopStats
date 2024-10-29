require "test_helper"

class SeasonTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @season_team = season_teams(:one)
  end

  test "should get index" do
    get season_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_season_team_url
    assert_response :success
  end

  test "should create season_team" do
    assert_difference("SeasonTeam.count") do
      post season_teams_url, params: { season_team: {  } }
    end

    assert_redirected_to season_team_url(SeasonTeam.last)
  end

  test "should show season_team" do
    get season_team_url(@season_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_season_team_url(@season_team)
    assert_response :success
  end

  test "should update season_team" do
    patch season_team_url(@season_team), params: { season_team: {  } }
    assert_redirected_to season_team_url(@season_team)
  end

  test "should destroy season_team" do
    assert_difference("SeasonTeam.count", -1) do
      delete season_team_url(@season_team)
    end

    assert_redirected_to season_teams_url
  end
end
