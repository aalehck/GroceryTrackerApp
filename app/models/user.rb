class User < ActiveRecord::Base
  has_secure_password
  has_one :grocery_list
end
