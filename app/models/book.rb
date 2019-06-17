class Book < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    belongs_to :author
    has_many :transactions
end
