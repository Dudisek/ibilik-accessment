
class User < ActiveRecord::Base
	# validates :email, uniqueness: true
	validates :email, presence: true, format: { with: /\w@\w{1}+[.]\w{2}/}, :uniqueness => true
	validates :password, length: {minimum: 6}

	
	has_many :comments
	has_many :properties
	has_secure_password

	has_many :bookings

end

