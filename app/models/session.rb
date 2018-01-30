class Session 
    extend ActiveModel::Naming
  include ActiveModel::AttributeMethods
  
   attr_accessor :name, :password
  
end 