class Area < ActiveRecord::Base
  belongs_to :island
  has_many :boards
  has_many :passes
  has_many :pass_users, through: :passes, source: :user
end
