class PodcastTag < ApplicationRecord
	belongs_to :tag
	belongs_to :podcast
end
