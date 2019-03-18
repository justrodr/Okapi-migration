class DashBoardController < ApplicationController
    def new
        @user = User.find_by(session[:user_id])
        puts @user.id, "****************"
    end
end
