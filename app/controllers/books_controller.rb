class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]


	def top
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def create
		@book = Book.new(book_params)
		@books = Book.all
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book.id)
		else
			render :index
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id), notice: "レビューを更新しました"
		else
			render :edit
		end
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

	def correct_user
    	@book = Book.find(params[:id])
    	if current_user.id !=  @book.user_id
      		redirect_to books_path
    	end
    end
end
