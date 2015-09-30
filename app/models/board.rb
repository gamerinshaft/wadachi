class Board < ActiveRecord::Base
  belongs_to :area
  belongs_to :user
  has_many :comments, dependent: :destroy
end
