class CreateAccessGrants < ActiveRecord::Migration
  def change
    create_table :access_grants do |t|
      t.references :user
      t.string :provider
      t.integer :uid
      t.string :omniauth_token

      t.timestamps
    end
    add_index :access_grants, :user_id
    add_index :access_grants, [:provider, :uid]
  end
end
