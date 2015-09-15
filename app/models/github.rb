class Github < ActiveRecord::Base
  has_many :languages, dependent: :destroy
end
