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
        session[:price_hash] = {"size10b20"=> 5.20,"size14b20"=> 5.20,"size16b24"=> 6.62,
               "size18b30"=> 7.93,"size12b12"=> 6.62,"size14b24"=> 5.67,"size16b25"=> 4.92, 
               "size20b20"=> 5.20,"size12b20"=> 5.11,"size14b25"=> 5.20,"size18b18"=> 6.62, 
               "size20b24"=> 6.24,"size12b24"=> 6.15,"size14b30"=> 6.62,"size18b20"=> 7.56,
               "size20b25"=> 5.67,"size12b30"=> 6.62,"size15b20"=> 7.09,"size18b24"=> 6.62, 
               "size20b30"=> 6.62,"size12b36"=> 8.89,"size16b20"=> 5.20,"size18b25"=> 7.09, 
               "size24b24"=> 6.62,"size25b25"=> 7.68}
        if(!(session[:email].nil?))
            @user = User.find_by(email: session[:email])
            #SubscriptionMailer.remind_email(@user).deliver
            if (@user.admin)
                redirect_to admin_path
            else
                redirect_to dash_path
            end
        end
    end 
    
    # def contacts
    # end
    
    def payment
    end
    
    def edit_order
    end
    
    def update_order    
          @order_up = Order.find params[:order][:id]
          @order_up.update(sent_date: params[:order][:sent_date])
          @order_up.update(delivered_date: params[:order][:delivered_date])
          redirect_to admin_path
    end
    
    # def orders
    # end

    def admin
        @all_orders = Order.all
        #@order = Order.find_by_id(1)
    end
    
    def new
        session[:log] = 1
        if(!session.nil?)
            @user = User.find_by(email: session[:email]) #why does first id make this nil in cucumber test
            puts session[:email]
        end
        @property = Property.new
        session[:properties] = Property.where(id: User.find_by(email: session[:email]))
        #SubscriptionMailer.sample_email(@user).deliver
    end
end
