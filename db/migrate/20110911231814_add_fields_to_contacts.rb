class AddFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :controller_name, :string, :default => "pages"
    add_column :contacts, :page_slug, :string
    add_column :contacts, :was_helpful, :boolean, :default => false
  end
end
