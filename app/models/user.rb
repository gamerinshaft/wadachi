class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :trackable
  has_one :profile, dependent: :destroy
  has_one :notification, dependent: :destroy
  has_one :dashboard, dependent: :destroy
end
