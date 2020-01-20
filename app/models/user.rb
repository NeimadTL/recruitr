class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true, uniqueness: true
  validates :lastname, presence: true, uniqueness: true
  validates :city, presence: true, uniqueness: true
  validates :country, presence: true, uniqueness: true

  belongs_to :role
  
end
