class ChangeCategoriesType < ActiveRecord::Migration
  def up
    add_column :categories, :is_help_page, :boolean
  end

  def down
    remove_column :categories, :is_help_page
  end
end
