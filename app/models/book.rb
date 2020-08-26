class Book < ApplicationRecord
    belongs_to :genre #the user that created it 
    has_many :books_lists, dependent: :destroy
    has_many :lists, through: :books_lists 
    has_many :users, through: :lists 
    has_many :reviews #from different users
    has_many :reviewers, through: :reviews, source: :user #book.reviewers users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 
    validates :title, uniqueness: { case_sensitive: false }


    accepts_nested_attributes_for :lists 
    
    #scope :sort_by_title, -> { order(title: :asc) }
   
    def self.search(search)
        search.blank? ? self.all : self.all.where("lower(title) LIKE ?", "%#{search}%")
    end

    def self.sort_by_title
    end 

    def self.sort_by_author 
    end 

    def self.sort_by_ratings 
    end 


end
