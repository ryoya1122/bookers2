class BooksController < ApplicationController
    before_action :authenticate_user!
    def edit
        @book = Book.find(params[:id])
        if @book.user==current_user
        else
            redirect_to books_path
        end
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice]="You have updated book successfully."
            redirect_to book_path(@book)
        else
            flash[:notice]="error"
            render :edit
        end
    end
    def create
    	@book = Book.new(book_params)
        @books = Book.all
        @book.user_id = current_user.id
        @user = User.new
        if @book.save
            flash[:notice] ="You have creatad book successfully."
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
        @book_1 = Book.new
        @post_comment = PostComment.new
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path

    end
    private
    def book_params
  		params.require(:book).permit(:title, :body, :user_id)
    end
end
