class DashBoardController < ApplicationController
    def new
        #abort("She cannot take any more of this, Captain!")
        session[:log] = 1
        if(!session.nil?)
            @user = User.find_by(email: session[:email]) #why does first id make this nil in cucumber test
            puts session[:email]
        end
        @property = Property.new
        session[:properties] = Property.where(id: User.find_by(email: session[:email]))
    end
end
