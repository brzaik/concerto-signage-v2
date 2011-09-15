class HelpPage < ActiveRecord::Base
	acts_as_list
	belongs_to :category

	# just include the Tanker module
	include Tanker
	tankit 'concerto_signage' do
		indexes :name
		indexes :content do
			content.gsub(/<\/?[^>]*>/, "")
		end
		indexes :tags
		indexes :category, :category => true do
			category.name
		end
	end
end
