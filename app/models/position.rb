class Position < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :position_skill_taggings
  has_many :skills, through: :position_skill_taggings

end
