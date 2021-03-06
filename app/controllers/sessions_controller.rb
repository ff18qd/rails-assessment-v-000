class SessionsController < ApplicationController
    def new
        # @user ||= User.new
        @session = Session.new
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
            @user = User.find_by(name: params[:session][:name])
            # binding.pry
            if  !!@user && @user.authenticate(params[:session][:password])
              session[:user_id] = @user.id
              redirect_to user_path(@user)
            else 
            #   redirect_to '/login'
                flash[:notice] = "Invalid user name and password. Please try again"
                # binding.pry
                @session=Session.new
                @session.name = params[:session][:name]
                @session.password = params[:session][:password]
                render :new
            end
        end 
    end 
    
    def destroy
      session.delete :user_id
      redirect_to root_path
    end
        
    
    private
 
    def auth
        request.env['omniauth.auth']
    end
        
    
end 