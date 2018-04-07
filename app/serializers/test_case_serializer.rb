class TestCaseSerializer < ActiveModel::Serializer
  attributes :id, :title, :next
  
  has_many :test_steps
end
