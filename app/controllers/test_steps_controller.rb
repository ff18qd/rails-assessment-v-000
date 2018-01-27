class TestStepsController < ApplicationController
  def index
    @test_steps = TestStep.all
  end
  
  def new
    # binding.pry
    @test_step = TestStep.new
    @test_case_id =  params[:test_case_id].to_i
 
  end 
  
  def create
    # binding.pry
    @test_step = TestStep.new(description: params[:test_step][:description])
    if @test_step.save
      @test_case_id = params[:test_case_id].to_i
      redirect_to test_case_test_steps_path(:test_case_id => @test_case_id, :test_step_id =>  @test_step.id)
    else
       redirect_to user_path(session[:user_id])
    end 
  end 
  
  
  
end
