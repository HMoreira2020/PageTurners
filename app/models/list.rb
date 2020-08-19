class List < ApplicationRecord
  belongs_to :user
  has_many :books_lists
  has_many :books, through: :books_lists, dependent: :destroy
  
  validates :title, presence: true, uniqueness: { scope: :user_id,
  message: "You already have a list with this title." }
  
 
  
  
end
