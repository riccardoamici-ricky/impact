class Event < ApplicationRecord
  has_many :users, through: :participations
end
