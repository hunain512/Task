class Category < ApplicationRecord
  has_many :items
  belongs_to :store
  validates :name, uniqueness: true, length: { minimum: 4, maximum: 12 }
end
