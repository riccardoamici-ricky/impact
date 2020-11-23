class CreateKarmapoints < ActiveRecord::Migration[6.0]
  def change
    create_table :karmapoints do |t|
      t.integer :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
