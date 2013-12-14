class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :country
      t.string :description
      t.string :profile_url
      t.string :avatar_url
      t.decimal :target_amount, default: 0.0
      t.decimal :raised_amount, default: 0.0

      t.timestamps
    end
  end
end
