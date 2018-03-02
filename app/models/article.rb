class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
	length: { minimum: 5 }
	belongs_to :user, optional: true
	def self.search(search)
		if search
			where("title like ?","%#{search}%")
		else
			all
		end
	end
end
