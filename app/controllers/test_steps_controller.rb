class TestStepsController < ApplicationController
  def index
    @test_steps = TestStep.all
  end
  
  def new
    @test_step = TestStep.new
  end 
  
  def create
    binding.pry
    
    
    redirect_to test_case_path(@test_case)
  end 
end
