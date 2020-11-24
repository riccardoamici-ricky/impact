class Post < ApplicationRecord
  belongs_to :user

  def self.categories
    ["Post", "Quote", "Recipe", "Tutorial", "Video"]
  end
end
