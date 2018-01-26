class SessionsController < ApplicationController
    def new
    end 
    
    def create
        # binding.pry
        if !!auth
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.password = auth[:info][:email]
            end
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @user = User.find_by(name: params[:user][:name])
            # binding.pry
            if  !!@user && @user.authenticate(params[:user][:password])
              session[:user_id] = @user.id
              redirect_to user_path(@user)
            else 
              redirect_to '/login'
            end
        end 
    end 
    
    
    
    private
 
    def auth
        request.env['omniauth.auth']
    end
        
    
end 