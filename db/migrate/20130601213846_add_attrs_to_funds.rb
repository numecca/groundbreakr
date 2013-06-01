class AddAttrsToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :country, :string
    add_column :funds, :description, :string
    add_column :funds, :profile_url, :string
    add_column :funds, :avatar_url, :string
    add_column :funds, :target_amount, :decimal
    add_column :funds, :raised_amount, :decimal
  end
end
