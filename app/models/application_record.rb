class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    def self.search(method, word)
      if method == "forward_match"
        @books = Book.where("title LIKE ?", "#{word}%")
      elsif method == "backward_match"
        @books = Book.where("title LIKE ?", "%#{word}")
      elsif method == "perfect_match"
        @books = Book.where(title: word)
      elsif method == "partial_match"
        @books = Book.where("title LIKE ?", "%#{word}%")
      else
        @books = Book.all
      end
  	end
end
