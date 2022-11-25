class User < ApplicationRecord
  has_many :posts, foreign_key: :user_id
  has_many :comments, through: :posts, foreign_key: :user_id
  has_many :likes, through: :posts, foreign_key: :user_id

  # Compare this snippet from app\models\post.rb:
  def recent_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
