class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :location
      t.string :url
      t.integer :price_range
      t.integer :planet_rating

      t.timestamps
    end
  end
end
