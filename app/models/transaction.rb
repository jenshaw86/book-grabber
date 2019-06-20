class Transaction < ApplicationRecord
    belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"
    belongs_to :receiver, :class_name => "User", :foreign_key => "receiver_id"
    belongs_to :book

    def book
        Book.find(self.book_id)
    end

    def book_title
        book.title
    end

    def book_author
        book.author.name
    end

    def receiver_name
        User.find(self.receiver_id).name
    end

    def sender_name
        User.find(self.sender_id).name
    end 
end