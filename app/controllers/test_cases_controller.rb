class TestCasesController < ApplicationController
    def show
        @test_case = TestCase.find(params[:id])
    end 
    
    def new 
        # binding.pry
        @test_case = TestCase.new
        
    end 
    
    def create 
        # binding.pry
        @test_case = TestCase.new(title: params[:test_case][:title])
        @user = User.find(session[:user_id])
        if @test_case.save
            @test_case.user = @user
            redirect_to test_case_path(@test_case)
        else 
            redirect_to user_path(@user)
        end 
            
    end 
    
    private 
    def tc_params
       params.require(:test_case).permit(:title, :user_id)
    end 
end 