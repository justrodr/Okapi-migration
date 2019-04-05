class OrderController < ApplicationController
    def new
        @order = Order.new
    end
    def create
        #@current_user = User.find_by(email: session[:email])
        #@order = Order.new(order_params)
    end
    
    def checkout
        @current_user = User.find_by(email: session[:email])
        @order = Order.new(order_params)
        @order.property = session[:property]
        #puts Property.find(@order.property).address
        @property = Property.find(@order.property)
        @order.shipping_address = @property.address
        @order.tenant_name = @property.tenant_name
        @order.tenant_email = @property.tenant_email
        @order.city = @property.city
        @order.state = @property.state
        @order.zipcode = @property.zipcode
        @order.frequency = @property.frequency
        @order.user = @current_user
        if @order.save?
            #do nothing
        else
            redirect_to order_path(@property)
            flash[:warning] = "property not saved"
        end
        end
    end
    
    private
        def order_params
            params.require(:order).permit(:shipping_address, :tenant_name, :tenant_email, :property, :order_status, :size10b20, :size14b20, :size16b24,
                :size18b30, :size12b12, :size14b24, :size16b25, :size20b20, :size12b20, :size14b25, :size18b18, :size20b24, :size12b24, :size14b30, :size18b20,
                :size20b25, :size12b30, :size15b20, :size18b24, :size20b30, :size12b36, :size16b20, :size18b25, :size24b24, :size25b25, :user)
            end
end
