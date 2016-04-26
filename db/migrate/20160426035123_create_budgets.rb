class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :budget_total
      t.decimal :budget_used
      t.string  :period
      t.date    :start
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
