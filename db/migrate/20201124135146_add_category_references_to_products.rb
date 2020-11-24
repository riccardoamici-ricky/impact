class AddCategoryReferencesToProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :category, :string
    add_reference :products, :category, null: false, foreign_key: true
  end
end
