require 'test_helper'

class PropertyControllerTest < ActionController::TestCase
  test "should get new" do
    get property_path
    assert_response :success
  end
end
