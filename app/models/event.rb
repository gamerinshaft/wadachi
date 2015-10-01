class Event < ActiveRecord::Base
  belongs_to :user
  has_many :participation_users, through: :participations
end
