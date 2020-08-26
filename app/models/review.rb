class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #validations for title, content, stars 
  validates :content, :stars, presence: true 

  scope :by_date, -> (limit) { order("created_at desc").limit(limit) }
 
end
