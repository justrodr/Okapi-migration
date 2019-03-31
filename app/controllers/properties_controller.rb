class PropertiesController < ApplicationController
  def new
    @property = Property.new
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end
  
  def show
    @property = Property.find params[:id]
  end
  
  def destroy
     @property = Property.find params[:id]
     @property.destroy
    #  flash[:notice] = "Property #{@property.prop_name} destroyed"
     session[:properties] = Property.where(user: User.find_by(email: session[:email]))
     redirect_to dash_path
  end 
  
  def edit 
    @property = Property.find params[:id]
  end
  
  def update
    @property = Property.find params[:property][:id]
     if(@property.update_attributes(prop_params))
        # flash[:notice] = "#{@property.prop_name} was successfully updated."
     else
       #flash[:notice] = "Please enter a valid property"
     end
     redirect_to dash_path
  end

  def create(property = nil)
    @current_user =  User.find_by(email: session[:email])
    @property = property || Property.new(prop_params)
    if(@current_user)
     @property.user = @current_user.id
    end
    if(@property.save)
      session[:test] = @property.user
      session[:properties] = Property.where(user: User.find_by(email: session[:email]))
      puts session[:properties].length
      redirect_to dash_path
    else
      # flash[:warning] = "Property Not Saved"
      redirect_to dash_path ###FIXME
    end
  end

  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency)
      end
end
