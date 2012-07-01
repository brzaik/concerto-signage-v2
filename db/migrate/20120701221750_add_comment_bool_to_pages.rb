class AddCommentBoolToPages < ActiveRecord::Migration
  def change
    add_column :pages, :allow_comments, :boolean
  end
end
