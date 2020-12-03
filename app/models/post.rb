class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.categories
    ["Photo", "Post", "Quote", "Recipe", "Tutorial", "Video"]
  end
end
