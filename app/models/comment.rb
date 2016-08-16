class Comment < ApplicationRecord
  validates_presence_of :content

  has_many   :likes, as: :likeable
  belongs_to :user
  belongs_to :discussion
end
