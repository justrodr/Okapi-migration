class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    #debugger
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Okapi!"
      redirect_to @user
    else
      flash.now[:notice] = "Account already exists for this email"
      render 'new'
    end
  end

    private 
      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_conformation)
      end
end