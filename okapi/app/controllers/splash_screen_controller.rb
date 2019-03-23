class SplashScreenController < ApplicationController
    def new
        session[:log] = 0
    end
    
    def show
       # redirect_to :controller => 'users', :action => 'new'
    end

    def create
    end
        
        #redirect_to :controller => 'sessions', :action =>'new'
end

