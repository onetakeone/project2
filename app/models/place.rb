class Place < ApplicationRecord
  validates :description, presence: true, length: { maximum: 1000 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 150 }  

  has_many :comments, as: :commentable
  belongs_to :user

  geocoded_by :address
  after_validation :geocode  
end
