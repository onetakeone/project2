class Order < ApplicationRecord
  validates :phone, presence: true, length: { maximum: 15 }
  
end
