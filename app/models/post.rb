class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.categories
    ["Post", "Quote", "Recipe", "Tutorial", "Video"]
  end
end
