class TestStepsController < ApplicationController
  def index
    @test_steps = TestStep.all
  end
  
  def new
    # binding.pry
    @test_step = TestStep.new
    @test_case_id =  params[:test_case_id].to_i
 
  end 
  
  def show 
     @test_step = TestStep.find(params[:id])
     render json: @test_step
  end 
  
  def create
    # binding.pry
    if !!TestStep.find_by(description: params[:test_step][:description])
       @test_step = TestStep.find_by(description: params[:test_step][:description])
    else 
      @test_step = TestStep.new(description: params[:test_step][:description])
    end 
     
    if @test_step.save
      # binding.pry
      @test_case_id = params[:test_case_id].to_i
      # @test_case_id = params[:test_step][:test_case_id].to_i
      @tcts = TestCaseTestStep.create(test_case_id: @test_case_id, test_step_id: @test_step.id, note: params[:test_step][:test_case_test_steps][:note])
      # redirect_to test_case_path(@test_case_id)
      
      render json: @test_step
    else
       redirect_to user_path(session[:user_id])
    end 
  end 
  
  
  
end
