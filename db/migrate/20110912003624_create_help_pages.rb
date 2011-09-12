class CreateHelpPages < ActiveRecord::Migration
  def change
    create_table :help_pages do |t|
      t.integer :category_id
      t.string :name
      t.text :content
      t.integer :user_id
      t.integer :position
      t.boolean :in_menu
      t.boolean :get_feedback
      t.string :short_description
      t.string :tags

      t.timestamps
    end
  end
end
