class BooksController < ApplicationController
	def new
    end
    def create
    end
    def index
    	@book = Book.new
    	@books = Book.all
    	@user = User.new
    	@users = User.all
    end
    def show
    end
end
