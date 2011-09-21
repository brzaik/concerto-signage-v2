class RemoveBlogTables < ActiveRecord::Migration
  def up
    drop_table :blog_categories
    drop_table :blog_comments
    drop_table :blog_posts
  end

  def down
  end
end
