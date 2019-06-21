class SessionsController < ApplicationController
	
	def new
		
	end
	
	def create
		@user = User.find_by(name: params[:name])
		# byebug
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			
			#flash[:message] = "Welcome #{@user.name}"
			redirect_to books_path
		else
			redirect_to login_path
		end
	end

	def destroy
		session.delete :user_id
				
		redirect_to home_path
	end
end