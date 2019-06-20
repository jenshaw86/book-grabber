class UsersController < ApplicationController
	before_action :logged_in, only: [:show, :tasks]
	
	def show
		@user = User.find(params[:id])
	end
	
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		
		if @user.save && user_params[:password] == user_params[:password_confirmation]
			session[:user_id] = @user.id
			
			redirect_to books_path
		else
			redirect_to new_user_path
		end
	end
	
	def tasks
		@user = User.find(session[:user_id])
	end

	# Create a new action, route, view for user's library?
	
	private
	
	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end