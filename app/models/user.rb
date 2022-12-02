class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, through: :posts, foreign_key: :author_id
  has_many :likes, through: :posts, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Compare this snippet from app\models\post.rb:
  def recent_three_posts
    posts.limit(3).order(created_at: :desc)
  end
end
