class User < ApplicationRecord
    has_many :books
    has_many :sent_transactions, :class_name => "Transaction", :foreign_key => "sender_id"
    has_many :received_transactions, :class_name => "Transaction", :foreign_key => "receiver_id"
    
    validates :name, presence: true, uniqueness: true
    
    has_secure_password
    
    def self.most_active
	    most_active_user = nil
	    num_transactions = 0
	    
	    self.all.each do |user|
		    if user.total_transactions > num_transactions
			    most_active_user = user
			    num_transactions = user.total_transactions
			  end
		  end
		  
		  most_active_user
	  end
	  
	  def total_transactions
		  total_transactions = self.sent_transactions.size + self.received_transactions.size
		end
		
		def self.most_active_name
			self.most_active.name
		end
		
		def self.most_transactions_count
			self.most_active.total_transactions
		end
		
end
