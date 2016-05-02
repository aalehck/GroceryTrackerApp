class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :budget_total, :default => 0.0
      t.decimal :budget_used, :default => 0.0
      t.string  :period, :default => "weekly"
      t.date    :start, :default => Date.today
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
