class SessionsController < ApplicationController
  def new
  end
  def create
    if !(params[:session].nil?)
      user = User.find_by(email: params[:session][:email].downcase) 
    end
    if user && user.authenticate(params[:session][:password])
      log_in user 
      redirect_to dash_path
    else 
      flash[:danger] = 'Invalid email/password'
      #render 'new'  test
      redirect_to '/login'
    end

    #if user && user.authenticate(params[:session][:password])
      #Login and redirect to dashboard here
    #else
      #The user login failed
      #redirect_to login_path, danger: "Invalid email or password"
    #end
    #render 'new'

  end
  def destroy
    log_out
    redirect_to root_url
  end
end
