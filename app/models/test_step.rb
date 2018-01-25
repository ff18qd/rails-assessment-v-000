class TestStep < ActiveRecord::Base
    has_many :test_case_test_steps
    has_many :test_case, through: :test_case_test_steps
    
end 