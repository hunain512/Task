 class Item < ApplicationRecord
  belongs_to :category 
  has_many :cart_items, dependent: :destroy 
  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 12 }
  validates :price, numericality: { less_than_or_equal_to: 100 }, format: {  with: /\A\d+(?:\.\d{0,2})?\z/, message: "must be a valid price"  }
  validates :quantity, numericality: { less_than_or_equal_to: 10}
  
end
