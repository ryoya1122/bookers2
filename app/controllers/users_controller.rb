class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@books = @user.books.page(params[:page]).reverse_order
		@book = Book.new
	end
	def index
		@user = User.new
		@users = User.all
		@book = Book.new
		@books = Book.all
	end
	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
    		flash[:notice]="You have updated user successfully."
    		redirect_to user_path(@user)
    	else
    		flash[:notice]="error"
    		render :edit
    	end
	end
	def edit
		@user = User.find(params[:id])
		if @user==current_user
		else
			redirect_to user_path(current_user)
		end
	end
	private
	def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
