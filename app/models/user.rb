class User < ApplicationRecord
	has_secure_password
	
	has_many :trips

	validates :email, presence: true,  uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :first_name, presence: true
	validates :phone, presence: true
end