class User < ApplicationRecord
    has_many :reviews, dependent: :destroy #that they created
    has_many :lists, dependent: :destroy #that they created 
    has_many :reviewed_books, through: :reviews, source: :book #that they have reviewed user.reviewed_books
    has_many :books, through: :lists #that they have created user.books will refer to their books on their lists
    
    #add validations name, email username, password 
    validates :name, presence: true 
    validates :username, presence: true, uniqueness: true
    validates :email, uniqueness: true, presence: true, 'valid_email_2/email': true

    has_secure_password 
    has_one_attached :image

    
   
    def self.create_by_facebook_omniauth(auth)
        self.where(email: auth[:info][:email]).first_or_create do |u|
            u.name = auth['info']['name']
            u.username = auth['info']['name'].delete(' ')
            u.image = auth['info']['image']
            u.uid = auth['info']['uid']
            u.password = SecureRandom.hex
        end
    end

    def self.create_by_google_omniauth(auth)
        self.where(email: auth[:info][:email]).first_or_create do |u|
            u.name = auth['info']['name']
            u.username = auth['info']['name'].delete(' ')
            u.image = auth['info']['image']
            u.password = SecureRandom.hex
        end
    end

   def can_review?(book)
        book.reviewers.include?(self) ? false : true 
   end 
    

end
