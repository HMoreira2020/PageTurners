class Genre < ApplicationRecord
    has_many :books
    #validations for name presence and uniqueness 
    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
