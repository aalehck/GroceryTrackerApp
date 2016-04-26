class Profile < ActiveRecord::Base
  has_one :budget
  belongs_to :user
end
