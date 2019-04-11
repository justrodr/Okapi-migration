require 'paypal-checkout-sdk'
class OrderController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @order = Order.new
    end
    def create
        #@current_user = User.find_by(email: session[:email])
        #@order = Order.new(order_params)
    end

    def cancel
        @cancel_order = Order.find_by(id: params[:id])
        @cancel_order.update(canceled: 1)
        puts @cancel_order.canceled
        redirect_to orders_page_path
    end
    
    def view
    end

    
  
    
    def paypal
        @order = session[:order]
        @order.save
        order_id = params[:orderID]
        # Creating Access Token for Sandbox
        client_id = ENV['PAYPAL_CLIENT_ID']
        client_secret = ENV['PAYPAL_CLIENT_SECRET']
        # Creating an environment
        environment = PayPal::SandboxEnvironment.new(client_id, client_secret)
        client = PayPal::PayPalHttpClient.new(environment)
        #request = OrdersGetRequest::new(order_id)
        request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest::new(order_id)
        # #3. Call PayPal to get the transaction
        response = client.execute(request) 
        # #4. Save the transaction in your database. Implement logic to save transaction to your database for future reference.
        puts "***************************"
        puts "Status Code: #"
        puts "Status: #"
        #puts response.result.id
        puts "Order ID: "
        puts order_id
        puts "Intent: #"
        puts "Links:"
        for link in response.result.links
        # You could also call this link.rel or link.href, but method is a reserved keyword for RUBY. Avoid calling link.method.
        puts "\t#{link["rel"]}: #{link["href"]}\tCall Type: #{link["method"]}"
        end
        puts "Gross Amount: # #"
        puts @order.id
        puts "***************************"
        @user1 = User.find_by(email: session[:email])
        #SubscriptionMailer.send_confirmation(@user1).deliver_later(wait_until: 2.minutes.from_now)
        #redirect_to orders_page_path
    end
    
    def orders_page
        @all_orders = Order.where(user: User.find_by(email: session[:email]).id)
        puts "&&&&&&&&&&&ALLSIZEALLSIZEALLSIZ&&&&&&&&&&&&"
        @all_orders.size
        puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
        
    end

    def checkout
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
        @current_user = User.find_by(email: session[:email])
        @order = Order.new(order_params)
        @order.property = session[:property] #
        #puts Property.find(@order.property).address
        @property = Property.find_by(id: @order.property)
        @order.shipping_address = @property.address
        @order.tenant_name = @property.tenant_name
        @order.tenant_email = @property.tenant_email
        @order.city = @property.city
        @order.state = @property.state
        @order.zipcode = @property.zipcode
        puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        puts params[:order][:start_date].class
        @order.start_date = params[:order][:start_date]
        puts @order.start_date
        puts @order.frequency
        @order.user = @current_user.id
        small_keys = []
        total_price = [] 
        keys = @order.attributes.keys
        keys.each do |subs| 
         if subs.include? "size" 
             small_keys.push subs 
         end
        end 
        small_keys.each do |key|
            if(@order.attributes[key]) 
                total_price.push session[:price_hash][key]*@order.attributes[key]
            end 
        end
        @order.price = total_price.inject(0){|sum,x| sum + x }+7.00 #plus 7 is for shipping
        puts @order.price
        puts "******************USERUSERUSERUSERUSERUSER*******************"
        puts @order.user
        puts "*************************************************************"
        session[:order] = @order
        redirect_to view_checkout_path(@order)
    end
    
    private
        def order_params
            params.require(:order).permit(:shipping_address, :frequency, :price, :tenant_name, :tenant_email, :property, :start_date,:order_status, :size10b20, :size14b20, :size16b24,
                :size18b30, :size12b12, :size14b24, :size16b25, :size20b20, :size12b20, :size14b25, :size18b18, :size20b24, :size12b24, :size14b30, :size18b20,
                :size20b25, :size12b30, :size15b20, :size18b24, :size20b30, :size12b36, :size16b20, :size18b25, :size24b24, :size25b25, :user)
        end
end
