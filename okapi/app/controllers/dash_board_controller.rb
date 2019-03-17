class DashBoardController < ApplicationController
    def new
        @user = User.find_by(id: session[:id])
        @property = Property.all
    end

end
