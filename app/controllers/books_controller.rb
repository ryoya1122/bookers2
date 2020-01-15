class BooksController < ApplicationController
	def new
    end
    def create
    	@book = Book.new(book_params)
  		@books = Book.all
  		@user = User.new
    	@users = User.all
    	@book.save
  		redirect_to book_path(@book)
    end
    def index
    	@book = Book.new
    	@books = Book.all
    	@user = User.new
    	@users = User.all
    end
    def show
    end
    private
    def book_params
  		params.require(:book).permit(:title, :body)
    end
end
