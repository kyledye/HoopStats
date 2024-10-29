require "test_helper"

class ShotTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shot_type = shot_types(:one)
  end

  test "should get index" do
    get shot_types_url
    assert_response :success
  end

  test "should get new" do
    get new_shot_type_url
    assert_response :success
  end

  test "should create shot_type" do
    assert_difference("ShotType.count") do
      post shot_types_url, params: { shot_type: {  } }
    end

    assert_redirected_to shot_type_url(ShotType.last)
  end

  test "should show shot_type" do
    get shot_type_url(@shot_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_shot_type_url(@shot_type)
    assert_response :success
  end

  test "should update shot_type" do
    patch shot_type_url(@shot_type), params: { shot_type: {  } }
    assert_redirected_to shot_type_url(@shot_type)
  end

  test "should destroy shot_type" do
    assert_difference("ShotType.count", -1) do
      delete shot_type_url(@shot_type)
    end

    assert_redirected_to shot_types_url
  end
end
