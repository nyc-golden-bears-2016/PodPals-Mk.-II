class Podcast < ApplicationRecord
  has_many :discussions
  has_many :podcast_users
  has_many :users, through: :podcast_users
  has_many :likes, as: :likeable
  has_many :shares
end

