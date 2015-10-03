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
  has_many :achievements
  has_many :participations
  has_many :participation_events, through: :participations, source: :event

  # follow
  has_many :relationships, :foreign_key => :follower_id, :dependent => :destroy
  has_many :following_users, :through => :relationships, :source => :followed

  # followed
  has_many :reversere_relationships, :class_name => 'Relationship', :foreign_key => :followed_id, :dependent => :destroy # 関連名(:followerships)とクラス名(Friendship)が異なっているので、:class_nameでクラス名を指定。foreign_key は:friend_idを使う。
  has_many :followed_users, :through => :reversere_relationships, :source => :follower # ":source => :user" の部分には、関連テーブルから先のモデルにアクセスするための(関連モデルから見た)関連名を入れる。ここでは、Friendshipモデルからその先のユーザ(user_idで繋がっている)に行くための関連名のシンボル :userを入れておく。

  def filtered_hash
    self.serializable_hash.except("github_token").symbolize_keys
  end
end
