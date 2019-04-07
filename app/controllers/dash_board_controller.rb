class DashBoardController < ApplicationController
    def splash 
       session[:order] = nil
       session[:sizes] = {"size10b20"=>"10\" x 20\" x 1\"","size14b20"=>"14\" x 20\" x 1\"","size16b24"=>"16\" x 24\" x 1\"",
               "size18b30"=>"18\" x 30\" x 1\"","size12b12"=>"12\" x 12\" x 1\"","size14b24"=>"14\" x 24\" x 1\"","size16b25"=>"16\" x 25\" x 1\"", 
               "size20b20"=>"20\" x 20\" x 1\"","size12b20"=>"12\" x 20\" x 1\"","size14b25"=>"14\" x 25\" x 1\"","size18b18"=>"18\" x 18\" x 1\"", 
               "size20b24"=>"20\" x 24\" x 1\"","size12b24"=>"12\" x 24\" x 1\"","size14b30"=>"14\" x 30\" x 1\"","size18b20"=>"18\" x 20\" x 1\"",
               "size20b25"=>"20\" x 25\" x 1\"","size12b30"=>"12\" x 30\" x 1\"","size15b20"=>"15\" x 20\" x 1\"","size18b24"=>"18\" x 24\" x 1\"", 
               "size20b30"=>"20\" x 30\" x 1\"","size12b36"=>"12\" x 36\" x 1\"","size16b20"=>"16\" x 20\" x 1\"","size18b25" =>"18\" x 25\" x 1\"", 
               "size24b24"=>"24\" x 24\" x 1\"","size25b25"=>"25\" x 25\" x 1\""}
        session[:price_hash] = {"size10b20"=> 30,"size14b20"=> 34,"size16b24"=> 40,
               "size18b30"=> 48,"size12b12"=> 24,"size14b24"=> 38,"size16b25"=> 41, 
               "size20b20"=> 40,"size12b20"=> 32,"size14b25"=> 39,"size18b18"=> 36, 
               "size20b24"=> 44,"size12b24"=> 36,"size14b30"=> 34,"size18b20"=> 38,
               "size20b25"=> 45,"size12b30"=> 42,"size15b20"=> 35,"size18b24"=> 42, 
               "size20b30"=> 50,"size12b36"=> 48,"size16b20"=> 36,"size18b25"=> 43, 
               "size24b24"=> 48,"size25b25"=> 50}
        if(!(session[:email].nil?))
            redirect_to dash_path
        end
    end 
    
    # def contacts
    # end
    
    def payment
    end
    
    # def orders
    # end
    
    def new
        session[:log] = 1
        if(!session.nil?)
            @user = User.find_by(email: session[:email]) #why does first id make this nil in cucumber test
            puts session[:email]
        end
        if (@user.admin)
            redirect_to admin_path
        end
        @property = Property.new
        session[:properties] = Property.where(id: User.find_by(email: session[:email]))
    end
end
