class Contact < ActiveRecord::Base
  include Rakismet::Model
  rakismet_attrs :author => :name, :author_email => :email
end
