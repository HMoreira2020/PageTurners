class List < ApplicationRecord
  belongs_to :user #the user that created it 
  has_many :books_lists
  has_many :books, through: :books_lists, dependent: :destroy
  #validations for title
  validates :title, presence: true, uniqueness: { scope: :user_id,
  message: "You already have a list with this title." }
  
  def book_attributes=(book_hash)
    book_hash.values.each do |book_attributes|
      self.books.build(book_attributes)
    end 
  end 

  def book_ids=(ids)
    ids.each do |id|
      book = Book.find(id)
      self.books << book
    end
  end
  

  
end
