class TestStep < ActiveRecord::Base
    has_many :test_case_test_steps
    has_many :test_cases, through: :test_case_test_steps
    
    validates :description, presence: true 
    
end 