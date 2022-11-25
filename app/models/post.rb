class Post < ApplicationRecord
  belongs_to :user, classname: 'User', foreign_key: :user_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  def update_posts_counter
    user.increment!(:post_counter)
  end

  def recent_five_comments
    comments.limit(5).order(created_at: :desc)
  end
end
