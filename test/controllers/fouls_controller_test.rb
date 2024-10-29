require "test_helper"

class FoulsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @foul = fouls(:one)
  end

  test "should get index" do
    get fouls_url
    assert_response :success
  end

  test "should get new" do
    get new_foul_url
    assert_response :success
  end

  test "should create foul" do
    assert_difference("Foul.count") do
      post fouls_url, params: { foul: {  } }
    end

    assert_redirected_to foul_url(Foul.last)
  end

  test "should show foul" do
    get foul_url(@foul)
    assert_response :success
  end

  test "should get edit" do
    get edit_foul_url(@foul)
    assert_response :success
  end

  test "should update foul" do
    patch foul_url(@foul), params: { foul: {  } }
    assert_redirected_to foul_url(@foul)
  end

  test "should destroy foul" do
    assert_difference("Foul.count", -1) do
      delete foul_url(@foul)
    end

    assert_redirected_to fouls_url
  end
end
