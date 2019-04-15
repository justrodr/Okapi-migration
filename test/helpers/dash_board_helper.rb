require 'test_helper'

class DashBoardHelperTest < ActionController::TestCase
     include DashBoardHelper
     test "calls order" do 
        
        assert_equal(sort_link("tenant_name", "Tenant &#8597"), (link_to "tentant_name" <span class='glyphicon glyphicon-chevron-up'></span>.html_safe, {column: "tenant_name", direction: asc}))

     end
end