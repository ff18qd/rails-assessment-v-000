class TestCasesController < ApplicationController
    def show
        
        @test_case = TestCase.find(params[:id])
        @all_test_steps = TestStep.all
        # binding.pry
        @steps = @test_case.test_case_test_steps.order(:step)
    end 
    
    def index
        # binding.pry
        if params[:id]
          @test_cases = User.find(params[:id]).test_cases
        else
          @test_cases = TestCase.all
        end
    end 
    
    def new 
        # binding.pry
        @test_case = TestCase.new
        @test_case.test_steps.build
        
    end 
    
    def create 
        # binding.pry
        # @test_case = TestCase.new(title: params[:test_case][:title])
        @test_case = TestCase.new(tc_params)
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
       params.require(:test_case).permit(:title, :user_id, test_steps_attributes: [:description])
    end 
end 