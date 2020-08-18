class List < ApplicationRecord
  belongs_to :user #the user that created it 
  has_many :books 
  #validations for title
  validates :title, presence: true, uniqueness: { scope: :user_id,
  message: "You already have a list with this title." }

  

  
end
