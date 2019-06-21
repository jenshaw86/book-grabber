class Book < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    belongs_to :author
    has_many :transactions
    
    validates :title, presence: true
    validates :description, presence: true
    
    def genre_name
        self.genre.name
    end
end
