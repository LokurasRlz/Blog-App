class Comment < ApplicationRecord
    belongs_to :user, classname: 'User', foreign_key: 'user_id'
    belongs_to :post, classname: 'Post', foreign_key: 'post_id'
  
    def update_comments_counter
      post.increment!(:comments_count)
    end
  end