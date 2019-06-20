class BooksController < ApplicationController
    before_action :logged_in
  
    def index
      @books = Book.all
    end
  
    def show
      @book = Book.find(params[:id])
      @transaction = Transaction.new
    end
  
    def new
	    @book = Book.new
	  end
	
	  def create
		  @book = Book.new(book_params)
		  
		  if @book.save
			  redirect_to user_path(session[:user_id])
			else
				redirect_to new_book_path
			end
	  end
	  
	  private
	  
	  def book_params
		  params.require(:book).permit(:title, :description, :author_id, :genre_id, :user_id)
		end
   
end