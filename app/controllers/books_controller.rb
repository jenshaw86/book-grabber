class BooksController < ApplicationController
   def index
    @books = Book.all
   end
   
   def show
    @book = Book.find(params[:id])
    @transaction = Transaction.new
   end
end