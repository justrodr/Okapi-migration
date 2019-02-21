require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(first_name: "Example First", last_name: "Example Last", email: "user@example.com", password: "password")
  end
  
  test "user should be valid" do 
    assert @user.valid?
  end
  
  test "password should be present" do
    @user.password = "   "
    assert_not @user.valid?
  end
  
  test "first name should be present" do
    @user.first_name = "    "
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = "    "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
