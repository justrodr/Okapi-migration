require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  # test "should create new user" do 
  #   get :create
  #   assert_response :success
  # end

end
