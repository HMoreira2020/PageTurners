class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #validations for title, content, stars 
  validates :title, :content, :stars, presence: true 
  
end
