class TestCaseTestStep < ActiveRecord::Base 
    belongs_to :test_case 
    belongs_to :test_step
    
    
end