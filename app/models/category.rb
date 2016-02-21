class Category < ActiveRecord::Base
	validates :name, presence: true, length: { miminum: 3, maximum: 25}
	has_many :post_categories
	has_and_belongs_to_many :posts, through: :categories_posts
end