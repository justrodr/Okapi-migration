require 'test_helper'

class Users::RegistrationsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
     
  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]

    @user = users(:one)
  end
  
  test "it should get new" do
    get :new
  end
  
  test "it should create a new user object" do
    get :new
    assert !(assigns(:user).nil?)
  end
  
  test "it should create" do
    post :create
  end
  
  test "it should destroy" do
    delete :destroy
  end
  
  test "user object should be nil" do
    delete :destroy
    assert (assigns(:user).nil?)
  end

# @controller = Users::RegistrationsController.new
 #@controller.instance_eval{ user_params }
 #@controller.instance_eval{ @user.valid? }
  
end