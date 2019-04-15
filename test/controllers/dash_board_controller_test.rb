require 'test_helper'

class DashBoardControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]
    @user = users(:one)
  end
  
   test "make splash screen for user" do
     controller = @controller
     controller.session[:email] = users(:one).email
     get :splash
     assert_redirected_to dash_path
   end
   
   test "should skip screen if admin logged in" do
    controller = @controller
      controller.session[:email] = users(:three).email
     get :splash
     assert_redirected_to admin_path
   end

   test "should skip screen if user logged in" do
     controller = @controller
      controller.session[:email] = users(:one).email
     get :splash
     assert_redirected_to dash_path
   end
   
   test "should get new" do
     controller = @controller
     controller.session[:email] = users(:one).email
     get :new
     assert_response :success
   end
   
   test "user should not be nil" do
    controller = @controller
    controller.session[:email] = users(:one).email
    get :new
    assert_not assigns(:user).nil?
   end
   

   test "user should not be nil show message" do
    controller = @controller
    controller.session[:email] = users(:one).email
    get :new
    assert_equal "Enter your first and last name. Do not enter any passwords", flash[:notice]
  end






   test "property should not be nil" do 
    controller = @controller
    controller.session[:email] = users(:one).email
    get :new
    assert_not assigns(:property).nil?
   end
end
