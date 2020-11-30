class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, through: :posts
  has_many :posts
  has_many :karmapoints
  has_many :reviews
  has_many :participations
  has_many :events, through: :participations
  has_many :likes, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  has_one_attached :photo
end
