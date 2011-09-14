class Category < ActiveRecord::Base
  has_many :pages
  has_many :help_pages
  
  scope :help_page_categories, where("is_help_page = true")
  scope :normal_page_categories, where("is_help_page = false")

end
