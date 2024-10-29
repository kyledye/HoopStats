require "test_helper"

class ShotGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shot_grade = shot_grades(:one)
  end

  test "should get index" do
    get shot_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_shot_grade_url
    assert_response :success
  end

  test "should create shot_grade" do
    assert_difference("ShotGrade.count") do
      post shot_grades_url, params: { shot_grade: {  } }
    end

    assert_redirected_to shot_grade_url(ShotGrade.last)
  end

  test "should show shot_grade" do
    get shot_grade_url(@shot_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_shot_grade_url(@shot_grade)
    assert_response :success
  end

  test "should update shot_grade" do
    patch shot_grade_url(@shot_grade), params: { shot_grade: {  } }
    assert_redirected_to shot_grade_url(@shot_grade)
  end

  test "should destroy shot_grade" do
    assert_difference("ShotGrade.count", -1) do
      delete shot_grade_url(@shot_grade)
    end

    assert_redirected_to shot_grades_url
  end
end
