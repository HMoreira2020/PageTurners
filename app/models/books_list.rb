  
class BooksList < ApplicationRecord
    belongs_to :book
    belongs_to :list
  end