class List < ApplicationRecord
  belongs_to :user #the user that created it 
  has_many :books
  #validations for title
  validates :title, presence: true, uniqueness: { scope: :user_id,
  message: "title already exists in your lists" }

  

  
end
