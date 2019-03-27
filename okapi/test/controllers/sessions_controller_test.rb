require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    #get :new
    get :new
    assert_response :success
  end

  test "login is invalid" do
  get :new
  #assert_redirected_to 'sessions/new'
  post :create, params: {session: {email: "", password: ""}}
  assert_redirected_to '/login'
  assert_not flash.empty?
  #get root_path
  #assert flash.empty?
  end

end
