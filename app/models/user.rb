class User < ActiveRecord::Base
	validates :name, length: {in: 2..20}
	validates :surname, length: {in: 2..30}
	validates :company, length: {in: 2..50}
	validates :email, presence: true, uniqueness: true
	validates :username, uniqueness: true, length:{in: 3..15}, format: {with: /\A[a-z0-9A-Z]+\z/}
  	has_secure_password
  	has_many :groups
end
