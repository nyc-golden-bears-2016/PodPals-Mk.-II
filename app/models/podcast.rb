class Podcast < ApplicationRecord
  has_many :tags, through: :podcast_tags
  has_many :discussions
  has_many :podcast_users
  has_many :users, through: :podcast_users
  has_many :podcast_tags
  has_many :likes, as: :likeable
end

