class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :shouts, dependent: :destroy

  has_many :likes
  has_many :liked_shouts, through: :likes, source: :shout

  # This is a relationship to the "follows" table ... 
  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "Follow",
    dependent: :destroy
  # ... which sets us up to get to the actual users
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "Follow",
    dependent: :destroy
  has_many :followers, through: :follower_relationships

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def like(shout)
    liked_shouts << shout
  end

  def liked?(shout)
    liked_shout_ids.include?(shout.id)
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def to_param
    username
  end
end
