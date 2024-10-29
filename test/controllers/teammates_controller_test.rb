require "test_helper"

class TeammatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teammate = teammates(:one)
  end

  test "should get index" do
    get teammates_url
    assert_response :success
  end

  test "should get new" do
    get new_teammate_url
    assert_response :success
  end

  test "should create teammate" do
    assert_difference("Teammate.count") do
      post teammates_url, params: { teammate: {  } }
    end

    assert_redirected_to teammate_url(Teammate.last)
  end

  test "should show teammate" do
    get teammate_url(@teammate)
    assert_response :success
  end

  test "should get edit" do
    get edit_teammate_url(@teammate)
    assert_response :success
  end

  test "should update teammate" do
    patch teammate_url(@teammate), params: { teammate: {  } }
    assert_redirected_to teammate_url(@teammate)
  end

  test "should destroy teammate" do
    assert_difference("Teammate.count", -1) do
      delete teammate_url(@teammate)
    end

    assert_redirected_to teammates_url
  end
end
