class Recipe < ActiveRecord::Base
  belongs_to :user
  serialize :information, Hash
end
