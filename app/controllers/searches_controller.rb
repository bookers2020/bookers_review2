class SearchesController < ApplicationController
	# 検索方法を複数の方式を採用、選択してサーチ実行
  def search
    method = params[:search_method]
    word = params[:search_word]
      @books = Book.search(method, word)
      render template: "books/search_result"
  end

  def presearch
    method = params[:search_method]
    word = params[:search_word]
      @books = Book.search(method, word)
      render template: "books/search"
  end
end
