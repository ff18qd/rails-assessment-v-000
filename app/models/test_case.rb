class TestCase < ActiveRecord::Base
    belongs_to :user
    has_many :test_case_test_steps
    has_many :test_steps, through: :test_case_test_steps
    
    # accepts_nested_attributes_for :test_steps
    
    validates :title, length: { minimum: 8 }
    
        
    def test_steps_attributes=(test_step_attributes)
        
        test_step_attributes.values.each do |test_step_attribute|
            # binding.pry
          test_step = TestStep.find_or_create_by(test_step_attribute)
          self.test_steps << test_step
        end
    end
    
    def next
        TestCase.where("id > ?", self.id).first
    end
    
end