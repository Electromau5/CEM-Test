class Seller < ActiveRecord::Base
	validates :sellername, presence: true,
	uniqueness: { case_sensitive: false },
	length: { minimum: 3, maximum: 25 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
	length: { maximum: 105 },
	uniqueness: { case_sensitive: false },
	format: { with: VALID_EMAIL_REGEX }
	
	validates :location, presence: true,
	length: { minimum: 3, maximum: 25 }
	
	VALID_SITE_REGEX = /\A[w]+[w]+[w]+.[a-z\d\-.]+\.[a-z]+\z/i
	validates :site, presence: true,
	uniqueness: { case_sensitive: false },
	length: { minimum: 3, maximum: 100 },
	format: { with: VALID_SITE_REGEX }
	
	before_save { self.email = email.downcase }
	
	has_many :listings, dependent: :destroy #all listings associated will be destroyed on account termination
	has_secure_password
end