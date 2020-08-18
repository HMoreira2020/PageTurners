class Book < ApplicationRecord
    belongs_to :genre 
    belongs_to :user #the user that created it 
    has_many :lists #on different users lists
    has_many :users, through: :lists #book.users
    has_many :reviews #from different users
    has_many :reviewers, through: :reviews, source: :user #book.reviewers users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 


    

   
   
end
