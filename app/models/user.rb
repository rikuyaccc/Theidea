class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image_name, ImageUploader

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id"
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_uer, through: :follwed, source: :follower

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  def posts
    return Post.where(user_id: self.id)
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    following_user.include?(user)
  end

  
  
end
