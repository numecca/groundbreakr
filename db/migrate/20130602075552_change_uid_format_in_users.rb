class ChangeUidFormatInUsers < ActiveRecord::Migration
  def up
    connection.execute(%q{
    alter table users
    alter column uid
    type integer using cast(uid as integer)
    })
  end

  def down
    change_table :users do |t|
      t.change :uid, :string
    end
  end
end
