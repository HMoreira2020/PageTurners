class Book < ApplicationRecord
    belongs_to :genre #the user that created it 
    has_many :books_lists
    has_many :lists, through: :books_lists 
    has_many :users, through: :lists 
    has_many :reviews #from different users
    has_many :reviewers, through: :reviews, source: :user #book.reviewers users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 
    validates :title, uniqueness: { case_sensitive: false, message: "This book is already in our database." }


    accepts_nested_attributes_for :lists 
    
    scope :sort_by_title, -> { order(title: :asc) }
    scope :filter_by_rating, -> { joins(:reviews).group("books.id").order("AVG(reviews.stars) DESC")}
    
   
    def self.search(search)
        search.blank? ? self.all : self.all.where("lower(title) LIKE ? or lower(author) LIKE ?", "%#{search}%", "%#{search}%")
    end


    def average_rating 
        self.reviews.average(:stars).to_f.round(2)
    end 






end
