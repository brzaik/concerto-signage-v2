class AddBannerImageFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :banner_image_file_name, :string
    add_column :pages, :banner_image_content_type, :string
    add_column :pages, :banner_image_file_size, :integer
    add_column :pages, :banner_image_updated_at, :datetime
  end
end
