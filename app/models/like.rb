class Like < ApplicationRecord
  belongs_to :user, classname: 'User', foreign_key: 'user_id'
  belongs_to :post, classname: 'Post', foreign_key: 'post_id'
  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_count)
  end
end
