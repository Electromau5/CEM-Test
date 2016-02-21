class Post < ActiveRecord::Base
  validates :title, :description, presence: true
  has_attached_file :image, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
  	                ["100x100>", :jpg, :quality => 70], large:  
  	                ['600>', :jpg, :quality => 70] }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_many :post_categories
  has_and_belongs_to_many :categories, through: :categories_posts
  has_and_belongs_to_many :listings
end