class UsersController < ApplicationController
  def new #this is the html
    @user = User.new
  end
  
  def index
  end
  
  def show #this is the html
    @user = User.find(params[:id])
    #debugger
  end
  
  def create #create is linked to POST HTTP Request
    @user = User.new(user_params)
    puts(@user.valid?)
    puts(@user.errors.messages)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Okapi!"
      redirect_to dash_path
    else
      flash[:notice] = "Account already exists for this email"
      redirect_to users_new_path
    end
  end

    private 
      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_conformation)
      end
end