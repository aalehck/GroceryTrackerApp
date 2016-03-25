class GroceryList < ActiveRecord::Base
  has_many :item, dependent: :destroy
end
