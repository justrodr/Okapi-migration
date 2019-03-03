class PropertyController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(prop_name)
    @current_user = @current_user || User.find_by(id: session[:user_id])
    @current_user.prop_index = @property.id #validate that user name matches property ID
  end
  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency)
      end
end
