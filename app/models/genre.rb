class Genre < ApplicationRecord
    has_many :books
    #validations for name presence and uniqueness 
end
