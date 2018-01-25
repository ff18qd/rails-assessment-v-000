class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :title
      t.integer :user_id
    end
  end
end
