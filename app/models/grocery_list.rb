class GroceryList < ActiveRecord::Base
  has_many   :items, as: :itemable, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :items
end
