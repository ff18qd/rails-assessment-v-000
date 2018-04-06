class TestStepSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_many :test_case_test_steps
end
