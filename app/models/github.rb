class Github < ActiveRecord::Base
  has_many :languages, dependent: :destroy
  has_many :repositories, dependent: :destroy
end
