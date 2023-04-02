class Store < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :user_stores 
  has_many :users, through: :user_stores 
  validates :name, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 12 }
end
