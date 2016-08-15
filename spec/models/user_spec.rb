require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#email" do
    it 'has an email' do
      user = User.create(email: "test@gmail.com", password: "testtest")
      expect(user.email).to eq("test@gmail.com")
    end

    it 'has a unique email address' do
      user = User.create(email: "test@gmail.com", password: "testtest")
      new_user = User.new(email: "test@gmail.com", password: "testtest")
      expect(new_user.save).to be(false)
    end
  end

  describe "#discussions" do
    it 'can create discussions' do
      user = User.create(email: "test@gmail.com", password: "testtest")
      user.discussions.create(title: "test", content: "test")
      expect(user.discussions.length).to eq(1)
    end

    it 'can delete discussions' do
      binding.pry
      user = User.create(email: "test@gmail.com", password: "testtest")
      user.discussions.create(title: "test", content: "test")
      Discussion.find_by(user_id: user.id).delete
      expect(user.discussions.length).to eq(0)
    end
  end
end
