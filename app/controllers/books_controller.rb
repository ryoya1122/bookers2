class BooksController < ApplicationController
	def new
        @book = Book.new
    end
    def create
    	@book = Book.new(book_params)
        @books = Book.all
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] ="Book was successfully created."
            redirect_to book_path(@book)
        else
            render 'index'
        end
    end
    def index
    	@book = Book.new
    	@books = Book.all
    	@user = User.new
    	@users = User.all
    end
    def show
        @book = Book.find(params[:id])
        @name = @book.user.name
        @user = @book.user
    end
    private
    def book_params
  		params.require(:book).permit(:title, :body, :user_id)
    end
end
