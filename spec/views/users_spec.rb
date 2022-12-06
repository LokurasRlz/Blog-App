require 'rails_helper'

RSpec.describe 'Users index', type: :view do
  before(:example) do
    @user = User.create!(name: 'Bob', photo: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png', bio: 'I am Bob')
    @post = Post.create!(title: 'My first post', text: 'This is my first post', user_id: @user.id)
  end

  it "displays the user's information" do
    visit users_path
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
    expect(page).to have_content(@user.photo)
    expect(page).to have_content(@post.length)
  end
end
