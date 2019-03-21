require 'test_helper'

class SessionsHelperTest < ActionController::TestCase
    include SessionsHelper
    test "should log_in" do
        log_in(users(:one))
        assert session[:email] == users(:one).email
    end
end