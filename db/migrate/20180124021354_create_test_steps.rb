class CreateTestSteps < ActiveRecord::Migration
  def change
    create_table :test_steps do |t|
      t.string :description
    end
  end
end
