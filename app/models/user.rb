class User < ApplicationRecord
    has_many :books
    has_many :sent_transactions, :class_name => "Transaction", :foreign_key => "sender_id"
    has_many :received_transactions, :class_name => "Transaction", :foreign_key => "receiver_id"
    
    validates :name, presence: true, uniqueness: true
    
end
