class BooksController < ApplicationController
   before_action :logged_in
   
   def index
    @books = Book.all
   end
   
   def show
    @book = Book.find(params[:id])
    @transaction = Transaction.new
   end
end