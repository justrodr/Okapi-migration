require 'test_helper'

class SessionsHelperTest < ActionController::TestCase
    include SessionsHelper
    test "should log_in" do
        log_in(users(:one))
        assert session[:email] == users(:one).email
    end
    
    test "logged_in should be 1" do
        log_in(users(:one))
        #assert assigns(:logged_in) == 1
    end
end