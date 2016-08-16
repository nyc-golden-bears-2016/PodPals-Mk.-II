class Tag < ApplicationRecord
	has_many :podcast_tags
	has_many :podcasts, through: :podcast_tags
end
