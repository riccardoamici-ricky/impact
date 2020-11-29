class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :user_id, presence: true

  def self.categories
    ["Post", "Quote", "Recipe", "Tutorial", "Video"]
  end
end
