class SearchesController < ApplicationController
  def search
    type = params[:search_type]
    method = params[:search_method]
    word = params[:search_word]
    if type == "book_match"
      @books = Book.search(type, method, word)
      render template: "#"
    end
  end
end
