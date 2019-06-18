class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		
		if @user.save
			session[:username] = @user.name
			
			redirect_to books_path
		else
			redirect_to new_user_path
		end
	end
	
	private
	
	def user_params
		params.require(:user).permit(:name)
	end
end