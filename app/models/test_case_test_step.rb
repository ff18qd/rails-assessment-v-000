class TestCaseTestStep < ActiveRecord::Base 
    belongs_to :test_case 
    belongs_to :test_step
    
    include RailsSortable::Model
    set_sortable :step
    
end