class Book < ApplicationRecord
    belongs_to :genre #the user that created it 
    has_many :books_lists
    has_many :lists, through: :books_lists 
    has_many :users, through: :lists 
    has_many :reviews, dependent: :destroy
    has_many :reviewers, through: :reviews, source: :user #book.reviewers users that have reviewed it 
    
    validates :title, :author, :synopsis, presence: true 
    validates :title, uniqueness: { case_sensitive: false, message: "This book is already in our database." }

    accepts_nested_attributes_for :lists 
    
    scope :sort_by_title, -> { order(title: :asc) }
    scope :filter_by_rating, -> { joins(:reviews).group("books.id").order("AVG(reviews.stars) DESC")}
    
   
    def self.search(search)
        search.blank? ? self.all : self.all.where("lower(title) LIKE ? or lower(author) LIKE ?", "%#{search}%", "%#{search}%")
    end 

    def avg_rating 
        self.reviews.average(:stars).to_f.round(2) 
    end 
 
    def already_on_list?(list) #call book.already_on_list(@list)
        list.books.include?(self) 
    end 

    def add_book(list)
        list.books << self
        list.save 
    end 


    def self.create_book_from_google(query)
        books_array = GoogleApi.search(query)
        books = books_array.map do |book_hash| 
            book = Book.find_or_create_by(book_hash)
        end 
        Book.where(id: books.pluck(:id))
    end 

end

