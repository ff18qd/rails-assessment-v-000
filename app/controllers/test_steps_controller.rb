class TestStepsController < ApplicationController
  def index
    @test_steps = TestStep.all
  end
  
  def new
    binding.pry
    @test_step = TestStep.new
    if params[:test_case_id] != nil
        @test_case_id = params[:test_case_id].to_i
        @test_step.test_case_id = params[:test_case_id].to_i
    end 
  end 
  
  def create
    # binding.pry
    
    
    redirect_to test_case_path(@test_case)
  end 
end
