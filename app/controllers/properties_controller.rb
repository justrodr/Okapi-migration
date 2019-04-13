class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end
  
  # def index #TODO if needed
  #   @properties = Property.paginate(:page=>params[:page], :per_page: 5)
  # end

  def show
    @property = Property.find params[:id]
  end
  
  def destroy
     @property = Property.find params[:id]
     @orders = Order.where(property: @property.id)
     @orders.each do |p|
      p.update(canceled: true)
     end
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
        redirect_to dash_path
     else
       flash[:warning] = @property.errors.full_messages.to_sentence
       redirect_to edit_property_path(@property)
     end

  end

  def create(property = nil)
    @current_user =  User.find_by(email: session[:email])
    @property = property || Property.new(prop_params)
    if(@current_user)
     @property.user = @current_user.id
    end

    if(Property.find_by(address: @property.address))
      redirect_to dash_path
      flash[:danger] = "Property already Exists"
      return
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

  def add
  end

  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency, :city, :state, :zipcode)
      end
end
