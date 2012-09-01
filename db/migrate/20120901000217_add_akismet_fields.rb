class AddAkismetFields < ActiveRecord::Migration
  def up
    add_column :contacts, :user_ip, :string
    add_column :contacts, :user_agent, :string
    add_column :contacts, :referrer, :string
  end

  def down
    remove_column :contacts, :user_ip
    remove_column :contacts, :user_agent
    remove_column :contacts, :referrer
  end
end
