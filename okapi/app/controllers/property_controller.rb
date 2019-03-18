class PropertyController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(prop_params)
    @current_user = User.find_by(id: session[:id])
    @property.update(user: @current_user.id)
    @property.update(last_delivered: Time.now)
    #@property.frequency = @property.frequency || 1
    puts @property.errors.messages
    redirect_to dash_path
    #session[:user][:prop_index] = session[:property][:id] #validate that user name matches property ID
  end
  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency)
      end
end
