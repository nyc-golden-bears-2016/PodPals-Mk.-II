class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friends, dependent: :destroy
  has_many :podcast_users
  has_many :podcasts, through: :podcast_users
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :discussions, dependent: :destroy

  # validates :email, presence: true, uniqueness: true
end
