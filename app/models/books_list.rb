class BooksList < ApplicationRecord
    belongs_to :book
    belongs_to :list


    validates_uniqueness_of :book_id, :scope => :list_id

  end