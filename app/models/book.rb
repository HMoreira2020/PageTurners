class Book < ApplicationRecord
    belongs_to :genre 
    belongs_to :user #the user that created it 
    has_many :lists #on different users lists
    has_many :users_who_added_book_to_list, through: :lists, source: user
    has_many :reviews #from different users
    has_many :users, through: :reviews #users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 
    

   
   
end
