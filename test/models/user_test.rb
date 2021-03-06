require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(first_name: "Example First", last_name: "Example Last", email: "user@example.com", password: "password", password_confirmation:"password")
  end
  
  test "user should be valid" do 
    assert @user.valid?
  end
  
  test "password should be present" do
    @user.password = "   "
    assert_not @user.valid?
  end

  test "password should be at least 7 characters long" do
    @user.password = "pass"
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
