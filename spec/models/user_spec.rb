require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_960_720.png', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too short' do
    subject.name = 'a'
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'posts_counter should not be string' do
    subject.posts_counter = 'abc'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should not be negative value' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end
end
