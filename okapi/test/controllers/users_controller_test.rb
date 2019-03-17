require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "create is invalid" do 
    #user = User.first
   # get :new
    #assert_template :new
    #post :create , params: {user: {first_name: "", last_name: "", email: "", password: "", password_conformation: ""}}
    #assert_redirected_to '/users/new'
    #assert_not flash.empty?
  end
  #  assert_response :success 
  #end
  
  #test ""
  # test "should create new user" do 
  #   get :create
  #   assert_response :success
  # end

end
