class Position < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :position_skill_taggings
  has_many :skills, through: :position_skill_taggings

  has_many :user_position_requests
  has_many :candidates, through: :user_position_requests, class_name: "User",
                                                         foreign_key: "user_id",
                                                              source: :user

end
