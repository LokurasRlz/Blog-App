require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png', bio: 'Teacher from Mexico.',
                        posts_counter: 0)
  end

  it 'renders posts of a user' do
    get "/users/#{@user.id}/posts"

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:index)

    expect(response.body).to include('Tom')
  end

  it 'renders a page for specific post' do
    post = Post.create(user: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                       comments_counter: 0)
    get "/users/#{@user.id}/posts/#{post.id}"

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:show)

    expect(response.body).to include('Hello by Tom')
  end
end
