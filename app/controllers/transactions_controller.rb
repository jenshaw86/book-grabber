class TransactionsController < ApplicationController
	before_action :logged_in
	
	def new
		#@transaction = Transaction.new
	end
	
	def create
		#add column for status, add sender_id
		@transaction = Transaction.create(transaction_params)
	end
	
	def accept
		@transaction = Transaction.find(params[:transaction][:received_transaction_id])
		@book = Book.find(@transaction.book_id)
		@book.user_id = @transaction.sender_id
		@book.save
		byebug
		@transaction.open = 0
		#save transaction somehow
		redirect_to tasks_path
	end

	def decline
	end
	private
	
	def transaction_params
		#later on add sender_id from session data
		params.require(:transaction).permit(:book_id, :receiver_id, :sender_id, :open)
	end
end