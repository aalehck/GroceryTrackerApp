class Inventory < ActiveRecord::Base
  has_many :items, as: :itemable, dependent: :destroy
  belongs_to :user
  
  def find_compatible_item(name, unit)
    Item.define_units unit
    item_unit = unit.to_unit
    possible_items = self.items.where("lower(name) = ?", name.downcase)
    possible_items.each do |i|
      if Item.define_units i.unit
        if i.unit.to_unit =~ item_unit
          return i
        end
      end
    end
    nil
  end
end
