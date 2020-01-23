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

  has_many :user_skill_taggings
  has_many :skills, through: :user_skill_taggings

  has_many :user_position_requests
  has_many :applications, through: :user_postion_requests, class_name: "Position",
                                                          foreign_key: "position_id"

end
