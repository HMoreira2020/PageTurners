class List < ApplicationRecord
  belongs_to :user #the user that created it 
  has_many :books
  #validations for title
  validates :title, presence: true 

  def book_ids=(ids)
    ids.each do |id|
      book = Book.find(id)
      self.books << book 
    end 
  end 

  
end
