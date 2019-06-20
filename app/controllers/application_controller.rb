class ApplicationController < ActionController::Base
    def logged_in
        if !session[:user_id]
            redirect_to login_path
        end
    end
    
    def home
	    @books = Book.all
	    @users = User.all
	    @genres = Genre.all
	    @authors = Genre.all
	    @transactions = Transaction.all
	  end
end
