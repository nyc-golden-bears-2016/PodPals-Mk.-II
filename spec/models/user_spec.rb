require 'rails_helper'

RSpec.describe User, type: :model do
  describe User, "#email" do
    it 'has an email' do
      test_user = User.create(email: "test@gmail.com")
      expect(test_user.email).to eq("test@gmail.com")
    end

    it 'has a unique email address' do
      test1 = User.create(email: "test@gmail.com")
      test2 = User.create(email: "test@gmail.com")
      expect(test2.id).to be(nil)
    end
  end
end
