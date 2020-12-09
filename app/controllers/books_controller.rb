class BooksController < ApplicationController

	def top
	end

	def index
		@book = Book.new
		@books = Book.all
	end

end
