class DropAuthorizationsTable < ActiveRecord::Migration
  def up
    drop_table :authorizations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
