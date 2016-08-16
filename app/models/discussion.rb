class Discussion < ApplicationRecord
  validates_presence_of :title, :content
  has_many :comments
  has_many :likes, as: :likeable

  belongs_to :podcast
  belongs_to :user
end
