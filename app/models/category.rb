class Category < ApplicationRecord
	has_many:aposts
	validates_uniqueness_of :category
end
