class Book < ApplicationRecord
    belongs_to :genre 
    belongs_to :user #the user that created it 
    has_many :books_lists
    has_many :lists, through: :books_lists
    has_many :reviews 
    has_many :users, through: :reviews #users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 
    

    #need a find_or_create_by method to prevent duplicate books being added to database
   
end
