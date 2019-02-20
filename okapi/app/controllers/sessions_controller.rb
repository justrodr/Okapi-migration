class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user 
      redirect_to user
    else 
      flash.now[:danger] = 'Invalid email/ password'
      render 'new'
    #if user && user.authenticate(params[:session][:password])
      #Login and redirect to dashboard here
    #else
      #The user login failed
      #render 'new'
    #end
    #render 'new'
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
