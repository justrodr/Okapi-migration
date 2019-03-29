class PropertyController < ApplicationController
  def new
    @property = Property.new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def create(property = nil)
    @current_user =  User.find_by(email: session[:email])
    @property = property || Property.new(prop_params)
    @property.user = @current_user.id
    if(@property.save)
      session[:test] = @property.user
      session[:properties] = Property.where(user: User.find_by(email: session[:email]))
      puts session[:properties].length
      redirect_to dash_path
    else
      puts @property.errors.messages
      puts "Property Not Saved"
      redirect_to dash_path ###FIXME
    end
  end

  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency)
      end
end
