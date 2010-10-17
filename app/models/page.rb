class Page < ActiveRecord::Base
  has_many :columns
  belongs_to :category
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
