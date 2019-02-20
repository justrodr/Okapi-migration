require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    #get :new
    get login_path
    assert_response :success
  end

  test "login is invalid" do
  get login_path
  assert_template 'session/new'
  post login_path, params: {session: {email: "", password: ""}}
  assert_template 'sessions/new'
  assert_not flash.empty?
  get root_path
  assert flash.empty?
  end

end
