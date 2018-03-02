class User < ApplicationRecord
	has_secure_password
	has_many :articles

	def self.search(id)
		if search
			where("id= ?","id")
		else
			all
		end
	end
end
