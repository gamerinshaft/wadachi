class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  self.primary_key = "uid"
  devise :omniauthable, :trackable
  has_one :profile, dependent: :destroy
  has_one :notification, dependent: :destroy
  has_one :github, dependent: :destroy
  has_one :flag, dependent: :destroy
  has_many :boards
  has_many :comments
  has_many :events
  has_many :participations
  has_many :participation_events, through: :participations, source: :event


  def filtered_hash
    self.serializable_hash.except("github_token").symbolize_keys
  end
end
