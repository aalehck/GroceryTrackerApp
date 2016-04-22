class User < ActiveRecord::Base
  has_secure_password
  has_one :grocery_list
  has_one :inventory
  has_many :recipes
end
