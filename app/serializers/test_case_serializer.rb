class TestCaseSerializer < ActiveModel::Serializer
  attributes :id, :title
  
  has_many :test_steps
end
