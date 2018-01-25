class User < ActiveRecord::Base
    has_secure_password
    
    has_many :test_cases
    has_many :test_steps, through: :test_cases
    
    validates :name, presence: true
end