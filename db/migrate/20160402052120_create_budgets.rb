class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :budget
      t.boolean :week
      t.boolean :month

      t.timestamps null: false
    end
  end
end
