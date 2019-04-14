require 'test_helper'

class DashBoardHelperTest < ActionController::TestCase
     include DashBoardHelper
     test "calls order" do 
         sort_link("tenant_name", "Tenant &#8597")
     end
end