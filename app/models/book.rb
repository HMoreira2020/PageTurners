class Book < ApplicationRecord
    belongs_to :genre 
    belongs_to :user #the user that created it 
    has_many :books_lists
    has_many :lists, through: :books_lists #on different users lists - how do I set this up without books lists?
    has_many :users, through: :lists #book.users
    has_many :reviews #from different users
    has_many :reviewers, through: :reviews, source: :user #book.reviewers users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 
    validates :title, uniqueness: { case_sensitive: false }


    

   
   
end
