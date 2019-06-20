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
	  
	  def edit
			@book = Book.find(params[:id])
		end
		
		def update
			@book = Book.find(params[:id])
			if @book.update(book_params)
				redirect_to user_path(@book.user_id)
			else
				redirect_to edit_book_path(@book.id)
			end
		end
		
		def destroy
			Book.destroy(params[:id])
			
			redirect_to user_path(session[:user_id])
		end	
		
	  
	  private
	  
	  def book_params
		  params.require(:book).permit(:title, :description, :author_id, :genre_id, :user_id)
		end
   
end