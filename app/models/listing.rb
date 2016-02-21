class Listing < ActiveRecord::Base
	validates :name, :description, :price, :condition, :location, presence: true
	validates :name, length: { minimum: 10, maximum: 100 }
	validates :description, length: { minimum: 25, maximum: 1000 }
	has_attached_file :image, styles: { medium: ["300x300>", :jpg, :quality => 70], thumb: 
  	                ["100x100>", :jpg, :quality => 70],  large:  
  	                ['1000>', :jpg, :quality => 70] }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    has_and_belongs_to_many :posts
    belongs_to :seller
end