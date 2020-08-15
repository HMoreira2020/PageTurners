class User < ApplicationRecord
    has_many :reviews #that they created
    has_many :lists #that they created 
    has_many :reviewed_books, through: :reviews, source: :book #that they have reviewed
    has_many :books #that they have created 
    has_secure_password 
    #add validations name, email username, password 

end
