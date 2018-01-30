class TestCaseTestStepsController < ApplicationController
    def create 
        # binding.pry
        # redirect_to test case show page
        @test_case_test_step = TestCaseTestStep.new(test_case_id: params[:test_case_id], test_step_id: params[:test_step_id])
        if params[:note]
             @test_case_test_step.note =  params[:note]
        end
        if @test_case_test_step.save 
            redirect_to test_case_path(params[:test_case_id])
        else 
            redirect_to user_path(session[:user_id])
        end 
        
    end 
    
    
end