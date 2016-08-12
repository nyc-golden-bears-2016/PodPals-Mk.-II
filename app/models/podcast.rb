class Podcast < ApplicationRecord
  has_many :users, through: :podcasts_users
  has_many :tags, through: :podcasts_tags
  has_and_belongs_to_many :artists
end
