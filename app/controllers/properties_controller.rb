class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end
  
  # def index #TODO if needed
  #   @properties = Property.paginate(:page=>params[:page], :per_page: 5)
  # end

  def index
    sort = params[:sort] || session[:sort]
    case sort
      when 'title'
        ordering,@title_header = {:title => :asc}, 'hilite'
      when 'release_date'
        ordering,@date_header = {:release_date => :asc}, 'hilite'
      end
    @all_ratings = Movie.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}
    
    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, rating]}]
    end
    
    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @selected_ratings
      redirect_to :sort => sort, :ratings => @selected_ratings and return
    end
    @movies = Movie.where(rating: @selected_ratings.keys).order(ordering)
  
  
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
