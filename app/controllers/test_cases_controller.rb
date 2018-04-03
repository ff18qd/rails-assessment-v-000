class TestCasesController < ApplicationController
    def show
        # binding.pry
        if params[:user_id]
            # binding.pry
            @user = User.find_by(id: params[:user_id])
            @test_case = @user.test_cases.find_by(id: params[:test_case_id])
            if @test_case == nil
                redirect_to user_test_cases_path(@user), alert: "Test case not found"
            else 
                @all_test_steps = TestStep.all
                @steps = @test_case.test_case_test_steps.order(:step)
            end
        else 
            @test_case = TestCase.find(params[:id])
            @all_test_steps = TestStep.all
            @steps = @test_case.test_case_test_steps.order(:step)
        end 
        
        # render json:  @test_case
    end 
    
    def index
        # binding.pry
        if params[:id]
          @test_cases = User.find(params[:id]).test_cases
        else
          @test_cases = TestCase.all
        end
        render json: @test_cases
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
            # binding.pry
            @test_case.user = @user
            @test_case.save
            # redirect_to test_case_path(@test_case)
            render json: @test_case
        else 
            redirect_to user_path(@user)
        end 
            
    end 

    
    private 
    def tc_params
       params.require(:test_case).permit(:title, :user_id, test_steps_attributes: [:description])
    end 
end 