class Area < ActiveRecord::Base
  belongs_to :island
  has_many :boards
end
