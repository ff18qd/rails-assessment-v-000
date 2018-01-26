class SessionsController < ApplicationController
    def new
    end 
    
    def create
        # binding.pry
        @user = User.find_by(name: params[:user][:name])
        if  !!@user && @user.authenticate(params[:user][:password])
          # binding.pry
           session[:user_id] = @user.id
           redirect_to user_path(@user)
        else 
          # binding.pry
           redirect_to '/login'
        end
        
    end 
    
    
    
    private
 
    def auth
        request.env['omniauth.auth']
    end
        
   
    
end 