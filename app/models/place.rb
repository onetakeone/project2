class Place < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :user

  geocoded_by :address
  after_validation :geocode  
end
