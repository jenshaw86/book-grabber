class TransactionsController < ApplicationController
	
	def new
		#@transaction = Transaction.new
	end
	
	def create
		#add column for status, add sender_id
		@transaction = Transaction.create(transaction_params)
		byebug
	end
	
	private
	
	def transaction_params
		#later on add sender_id from session data
		params.require(:transaction).permit(:book_id, :receiver_id)
	end
end