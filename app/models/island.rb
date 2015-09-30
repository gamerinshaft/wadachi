class Island < ActiveRecord::Base
  has_many :areas, dependent: :destroy
end
