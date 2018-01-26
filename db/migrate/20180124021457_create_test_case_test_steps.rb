class CreateTestCaseTestSteps < ActiveRecord::Migration
  def change
    create_table :test_case_test_steps do |t|
      t.integer :test_case_id
      t.integer :test_step_id
      t.integer :step
    end
  end
end
