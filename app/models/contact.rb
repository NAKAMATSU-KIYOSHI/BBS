class Contact < ApplicationRecord
	validates :email, prosence: true, length: {maximum:255}, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
	validates :message, prosence: true
end
