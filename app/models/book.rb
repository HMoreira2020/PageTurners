class Book < ApplicationRecord
    belongs_to :genre #the user that created it 
    has_many :books_lists
    has_many :lists, through: :books_lists #on different users lists - how do I set this up without books lists?
    has_many :users, through: :lists #book.users
    has_many :reviews #from different users
    has_many :reviewers, through: :reviews, source: :user #book.reviewers users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 
    validates :title, uniqueness: { case_sensitive: false }

    # has_one_attached :image 
    

   
    def self.search(search)
        search.blank? ? self.all : self.all.where("lower(title) LIKE ?", "%#{search}%")
    end

    def already_on_list?(list, book)
        list.include?(book) ? true : false 
    end 

    def add_to_list(list, book)
        if !already_on_list?(list, book)
            list.books.build(book_params)
        else 
            "This book has already been added to your list" 
        end 
    end 

    def self.sort_by_title
    end 

    def self.sort_by_author 
    end 

    def self.sort_by_ratings 
    end 


end
