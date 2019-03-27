require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

   test "should create new user" do 
     get :new
     post :create, :user =>{"first_name"=>"a", "last_name"=>"a", "email"=>"john@tamu.edu", "password"=>"1234567", "password_confirmation"=>"1234567"} 
     assert_redirected_to dash_path
   end

end
