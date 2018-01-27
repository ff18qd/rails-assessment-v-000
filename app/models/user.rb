class User < ActiveRecord::Base
    has_secure_password
    
    has_many :test_cases
    has_many :test_steps, through: :test_cases
    
    validates :name, presence: true
    
       
    def self.most_test_cases
        where("test_cases_count >=?", 5)
        self.joins(:test_cases).group("user_id").having("count(test_cases.id) > ?",5)
    end 
    
end