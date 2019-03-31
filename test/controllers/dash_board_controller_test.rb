require 'test_helper'

class DashBoardControllerTest < ActionController::TestCase
   test "make splash screen" do
     get :splash
   end
   
   test "should skip screen if user logged in" do
     controller = @controller
     controller.session[:email] = "hi"
     get :splash
   end
   
   test "should get new" do
     get :new
   end
   
   test "user should not be nil" do
    controller = @controller
    controller.session[:email] = users(:one).email
    get :new
    assert_not assigns(:user).nil?
   end
   
   test "property should not be nil" do 
    controller = @controller
    controller.session[:email] = users(:one).email
    get :new
    assert_not assigns(:property).nil?
   end
end
