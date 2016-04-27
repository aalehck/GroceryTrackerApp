class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.decimal :amount, :default => 0.0
      t.string  :unit
      t.decimal :cost
      t.integer :calories
      t.decimal :carbs
      t.decimal :sugar
      t.decimal :cholesterol
      t.decimal :sodium
      t.decimal :protein
      t.decimal :b1
      t.decimal :selenium
      t.decimal :folate
      t.decimal :manganese
      t.decimal :b3
      t.decimal :b2
      t.decimal :iron
      t.decimal :phosphorus
      t.decimal :fiber
      t.decimal :copper
      t.decimal :magnesium
      t.decimal :zinc
      t.decimal :b5
      t.decimal :potassium
      
      
      t.references :itemable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
