class AddPriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :price, :integer
    remove_column :products, :price_range
  end
end
