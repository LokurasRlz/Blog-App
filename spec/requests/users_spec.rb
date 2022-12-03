require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users'
    end

    it 'return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'should respond with a correct template' do
      expect(response).to render_template(:index)
    end

    it 'body should have correct  placeholder text' do
      expect(response.body).to include('Tom')
    end
  end

  it 'renders a page for specific user' do
    user = User.create(name: 'Tom', photo: 'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    get "/users/#{user.id}"

    expect(response).to have_http_status(:ok)

    expect(response).to render_template(:show)

    expect(response.body).to include('Tom')
  end
end
