class AddKarmapointsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :karma_points, :integer, default: 130
  end
end
