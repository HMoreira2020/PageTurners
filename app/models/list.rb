class List < ApplicationRecord
  belongs_to :user
  has_many :books_lists
  has_many :books, through: books_lists 
  #validations for title
end
