class AddShortDescriptionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :short_description, :string
  end
end
