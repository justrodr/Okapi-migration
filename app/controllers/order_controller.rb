class OrderController < ApplicationController
    def new
        @order = Order.new
    end
    def create
        @current_user = User.find_by(email: session[:email])
        @order = Order.new(order_params)
    end
    
    private
        def order_params
            params.require(:order).permit(:shipping_address, :tenant_name, :tenant_email, :size, :property, :order_status)
end
