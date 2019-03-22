class PropertyController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @current_user =  User.find_by(email: session[:email])
    @property = Property.new(prop_params)
    if(@current_user)
      @property.user = @current_user.id
    end
    if(@property.save)
      redirect_to dash_path
    else
      puts @property.errors.messages
      redirect_to contact_path ###FIXME
    end
  end
  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency)
      end
end
