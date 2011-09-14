class ChangePageImages < ActiveRecord::Migration
  def up
    remove_column :pages, :banner_image_file_name
    remove_column :pages, :banner_image_content_type
    remove_column :pages, :banner_image_file_size
    remove_column :pages, :banner_image_updated_at
    add_column :pages, :ckeditor_asset_id, :integer
  end

  def down
    remove_column :pages, :ckeditor_asset_id
    add_column :pages, :banner_image_file_name, :string
    add_column :pages, :banner_image_content_type, :string
    add_column :pages, :banner_image_file_size, :integer
    add_column :pages, :banner_image_updated_at, :datetime
  end
end
