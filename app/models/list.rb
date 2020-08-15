class List < ApplicationRecord
  belongs_to :user #the user that created it 
  has_many :books_lists
  has_many :books, through: books_lists 
  #validations for title
  validates :title, presence: true 
end
