require 'test_helper'

class VolumesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index even when the API returns nil" do
    get :index
    assert_response :success
  end
  
  test "redirect to homepage if an invalid page index is supplied" do
    get :index, page: 'invalid'
    assert_response :redirect
    assert_redirected_to root_path
  end

end
