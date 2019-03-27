require 'test_helper'

class Users::PasswordsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
     
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]

    @user = users(:one)
  end
  
    test "it should get new" do
      get :new
   end
   
   test "it should sign in" do
      post :create
   end
   
   test "it should edit" do
      get :edit, "reset_password_token=abcdef"
   end
   
   test "it should update" do
      post :update
   end
end