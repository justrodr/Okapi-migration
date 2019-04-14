# @controller = SessionsController.new
require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
   test "should get new" do
     get :new
     assert_response :success
   end
   
   test "should create user and redirect to dash_path" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"prop_name"=>"house", "tenant_name"=>"Adam", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567", "address"=>"1234567", "frequency"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (state invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TeX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "if property not created (name invalid), should stay on dash" do 
      #get :new
      @controller.session[:email] = users(:one).email
      post :create, :property =>{"tenant_name"=>"1111", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TeX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "should make property have user field of logged in user" do
      controller = @controller
      controller.session[:email] = users(:one).email
      post :create, :property =>{"prop_name"=>"house", "tenant_name"=>"Adam", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567891", "address"=>"123456h7"}
      #Property.create({"user" => 0,"prop_name"=>"house", "tenant_name"=>"Adam", "tenant_email"=>"adam@tamu.edu", "tenant_phone"=>"1234567", "address"=>"1234567", "frequency"=>"1"})
      assert controller.session[:test] == users(:one).id
   end
   
   test "put update should update property" do
      put :update, :id => 1, :property =>{"tenant_name"=>"Hunter Hewitt", "tenant_phone"=>"", "tenant_email"=>"hunterhewitt@tamu.edu", "prop_name"=>"", "address"=>"22 Coastal Meadow", "city"=>"Katy", "state"=>"TX", "zipcode"=>"77494", "id"=>"1"}
      assert_redirected_to dash_path
   end
   
   test "should find from params" do
      get :show,  :id => 1
      assert_response :success
   end
   
   test "post edit should update property" do
      post :edit, :id => Property.first.id 
      assert_response :success
   end
   
   test "delete should destroy an object" do
      delete :destroy, :id => Property.first.id
      assert_redirected_to dash_path
   end
end
