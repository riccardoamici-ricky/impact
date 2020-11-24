class AddNeighbourhoodToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :neighbourhood, :string
  end
end
