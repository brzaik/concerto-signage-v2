class RemoveUserSessions < ActiveRecord::Migration
  def up
    drop_table :user_sessions
  end

  def down
  end
end
