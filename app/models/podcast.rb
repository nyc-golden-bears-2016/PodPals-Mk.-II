class Podcast < ApplicationRecord
  has_many :discussions
  has_many :podcast_users
  has_many :users, through: :podcast_users
end

