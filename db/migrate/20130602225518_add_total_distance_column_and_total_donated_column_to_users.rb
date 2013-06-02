class AddTotalDistanceColumnAndTotalDonatedColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_distance, :decimal, precision: 10, scale: 2, default: 0
    add_column :users, :total_donated, :decimal, precision: 10, scale: 2, default: 0
  end
end
