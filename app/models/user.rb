class User < ApplicationRecord
  has_many :stores
  has_many :user_stores
  has_many :stores, through: :user_stores     
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
