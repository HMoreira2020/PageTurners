class User < ApplicationRecord
    has_many :reviews #that they created
    has_many :lists #that they created 
    has_many :reviewed_books, through: :reviews, source: :book #that they have reviewed
    has_many :books #that they have created 
    
    #add validations name, email username, password 
    validates :name, uniqueness: true, presence: true 
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true, 'valid_email_2/email': true

    has_secure_password 
end
