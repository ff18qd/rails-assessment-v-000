class TestCase < ActiveRecord::Base
    belongs_to :user
    has_many :test_case_test_steps
    has_many :test_steps, through: :test_case_test_steps
    
end