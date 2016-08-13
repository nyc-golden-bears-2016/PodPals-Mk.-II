class Discussion < ApplicationRecord
  validates_presence_of :title, :content
  has_many :comments
  belongs_to :podcast
  belongs_to :user
end
