class TestCasesController < ApplicationController
    def show
        @test_case = TestCase.find(params[:test_case_id])
    end 
end 