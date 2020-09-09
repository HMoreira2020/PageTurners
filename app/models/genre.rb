class Genre < ApplicationRecord
    has_many :books, :dependent => :destroy
    
    validates :name, presence: true, uniqueness: true

    scope :sort_by_name, -> { order(name: :asc) }
end
