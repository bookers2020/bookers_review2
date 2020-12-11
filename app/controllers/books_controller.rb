class BooksController < ApplicationController

	def top
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def create
		@book = Book.new(book_params)
		@books = Book.all
		if @book.save
			redirect_to books_path(@book.id)
		else
			render :index
		end
	end

	def show
	end

	def destroy
		book = Book.find(params[:id])
		if book.destroy
			redirect_to books_path(book)
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
