class DashBoardController < ApplicationController
    def new
        @user = User.find_by(id: session[:id])
        #puts("\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
        #puts @user.id
    end
end
