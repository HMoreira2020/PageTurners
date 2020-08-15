class Book < ApplicationRecord
    belongs_to :genre
    has_many :books_lists
    has_many :lists, through: books_lists
    has_many :users, through: lists

    #add validations 
    #title, author, synopsis 
end
