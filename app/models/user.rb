class User < ApplicationRecord
    has_many :reviews 
    has_many :lists
    has_many :books, through: :lists
    has_secure_password 
    #add validations name, email username, password 

end
