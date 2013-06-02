class AddRunCountColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :run_count, :integer, default: 0
  end
end
