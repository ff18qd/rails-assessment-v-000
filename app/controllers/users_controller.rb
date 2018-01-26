class UsersController < ApplicationController
    def new
    
    end 
    
    def create
        # binding.pry
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/signup'
        end 
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def destroy
      session.delete :user_id
      redirect_to root_path
    end
        
    
    
    private
     
    def user_params
        params.require(:user).permit(:name, :password)
    end
 
    
    
end