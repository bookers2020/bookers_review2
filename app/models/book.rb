class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, precence: true
end
