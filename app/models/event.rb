class Event < ApplicationRecord
  has_many :users, through: :participations

  validates :title, presence: true, uniqueness: true
  validates :address, :start_time, :category, :description, presence: true

  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [ :title, :category ],
  #   # associated_against: {
  #   #   director: [ :first_name, :last_name ]
  #   # },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

end
