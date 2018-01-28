class UsersController < ApplicationController
    before_action :require_login, only: [:show]
    
    
    def new
         @user = User.new
    end 
    
    def create
        # binding.pry
        @user = User.new(user_params)
        # binding.pry
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            # redirect_to '/signup'
            render :new
        end 
    end
    
    def show
        @user = User.find_by(id: params[:id])
        @most = User.most_test_cases
        # binding.pry
        if !@user || session[:user_id] != @user.id 
            redirect_to user_path(session[:user_id])
        end 
    end
    
    # def destroy
    #   session.delete :user_id
    #   redirect_to root_path
    # end
    
    def most_test_cases
       @most =  User.most_test_cases
    end
        
     
    private
     
    def user_params
        params.require(:user).permit(:name, :password)
    end
 
    def require_login
        # !!session[:user_id]
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to root_path # halts request cycle
        end
    end
    
    
end
