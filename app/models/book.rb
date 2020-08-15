class Book < ApplicationRecord
    belongs_to :genre
    belongs_to :user
    has_many :books_lists
    has_many :lists, through: :books_lists
    has_many :reviews 
    has_many :users, through: :reviews
    
    

    #add validations 
    #title, author, synopsis 
end
