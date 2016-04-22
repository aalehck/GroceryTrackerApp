class Inventory < ActiveRecord::Base
  has_many :items, as: :itemable, dependent: :destroy
  belongs_to :user
end
