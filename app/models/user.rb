class User < ApplicationRecord
    has_many :reviews, dependent: :destroy #that they created
    has_many :lists, dependent: :destroy #that they created 
    has_many :reviewed_books, through: :reviews, source: :book #that they have reviewed
    has_many :books, through: :lists #that they have created 
    
    #add validations name, email username, password 
    validates :name, uniqueness: true, presence: true 
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true, 'valid_email_2/email': true

    has_secure_password 

   def add_book_to_list()
   end 


    
end
