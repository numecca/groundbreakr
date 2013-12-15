class CreateSponsorables < ActiveRecord::Migration
  def change
    create_table :sponsorables do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :sponsorables, :user_id
    add_index :sponsorables, :project_id
  end
end
