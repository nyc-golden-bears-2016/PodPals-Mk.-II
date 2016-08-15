class Friend < ApplicationRecord
  belongs_to :user, inverse_of: :friend
  belongs_to :friend, :class_name => 'User'

  validates_uniqueness_of :friend_id, scope: :user_id
end
