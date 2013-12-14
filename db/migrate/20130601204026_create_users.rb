class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :photo_url
      t.integer :run_count, default: 0
      t.decimal :total_distance, precision: 10, scale: 2, default: 0.0
      t.decimal :total_donated, precision: 10, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
