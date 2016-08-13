class Podcast < ApplicationRecord
  has_many :podcast_users
  has_many :users, through: :podcast_users
  has_many :tags, through: :podcasts_tags
  has_and_belongs_to_many :artists
end
