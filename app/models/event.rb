class Event < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :title, presence: true, uniqueness: true
  validates :address, :start_time, :category, :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.categories
    ["Charity", "Environment", "Sustainability", "Protests"]
  end

  def self.neighbourhoods
    ["Charlottenburg-Wilmersdorf", "Friedrichshain-Kreuzberg", "Lichtenberg", "Marzahn-Hellersdorf", "Mitte", "Neukölln", "Pankow", "Reinickendorf", "Spandau", "Steglitz-Zehlendorf", "Tempelhof-Schöneberg", "Treptow-Köpenick"]
  end

  def facts
    ['a', 'b', 'che cosaaaaa']
  end
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
