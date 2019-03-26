require 'test_helper'

class PropertyControllerTest < ActionController::TestCase
   test "should get new" do
     get :new
     assert_response :success
   end
   
   test "should create user and redirect to dash_path" do
      controller = @controller
     # @controller = SessionsController.new
     #get :new
      #post :create, :user =>{"first_name"=>"a", "last_name"=>"a", "email"=>"john@tamu.edu", "password"=>"1234567", "password_confirmation"=>"1234567"}
      #@controller = old_controller
      controller.session[:email] = users(:one).email
      get :new
      post :create, :property =>{"prop_name"=>"house", "tenant_name"=>"Adam", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567", "address"=>"1234567", "frequency"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if user not created (user invalid), should still redirect" do 
      get :new
      post :create, :property =>{"prop_name"=>"   ", "tenant_name"=>"  ", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567", "address"=>"1234567", "frequency"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if user not created (user invalid), should flash to screen" do 
      get :new
      post :create, :property =>{"prop_name"=>"   ", "tenant_name"=>"  ", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567", "address"=>"1234567", "frequency"=>"1"}
      assert_not flash.empty?
   end
   
   test "should make property have user field of logged in user" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"prop_name"=>"house", "tenant_name"=>"Adam", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567", "address"=>"1234567", "frequency"=>"1"}
      #Property.create({"user" => 0,"prop_name"=>"house", "tenant_name"=>"Adam", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567", "address"=>"1234567", "frequency"=>"1"})
      assert controller.session[:test] == users(:one).id
   end
end
