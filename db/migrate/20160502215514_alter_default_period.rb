class AlterDefaultPeriod < ActiveRecord::Migration
  def change
    change_column :budgets, :period, :string, default: "weekly"
  end
end
