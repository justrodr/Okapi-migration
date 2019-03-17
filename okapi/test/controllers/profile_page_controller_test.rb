require 'test_helper'

class ProfilePageControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
end
