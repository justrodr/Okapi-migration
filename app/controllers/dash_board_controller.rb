class DashBoardController < ApplicationController
    def new
        session[:log] = 1
        if(!session.nil?)
            @user = User.find_by(email: session[:email]) #why does first id make this nil in cucumber test
            puts session[:email]
        end
        @property = Property.new
        @properties = Property.all
    end
end
