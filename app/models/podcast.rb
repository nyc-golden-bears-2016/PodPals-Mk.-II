class Podcast < ApplicationRecord
  has_many :users, through: :podcast_users
  has_many :tags, through: :podcast_tags
  has_many :discussions
  has_and_belongs_to_many :artists
end
