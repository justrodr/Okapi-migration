require 'test_helper'

class PropertyControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
end