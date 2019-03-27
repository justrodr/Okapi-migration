class PropertyController < ApplicationController
  def new
    @property = Property.new
  end

  def create(property = nil)
    @current_user =  User.find_by(email: session[:email])
    @property = property || Property.new(prop_params)
    if(@current_user)
      @property.user = @current_user.id
      #puts @property.user
    end
    if(@property.save)
      session[:test] = @property.user
      redirect_to dash_path
    else
      #puts @property.errors.messages
      flash[:warning] = "Please input a valid Property"
      redirect_to dash_path ###FIXME
    end
  end
  
  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency)
      end
end
