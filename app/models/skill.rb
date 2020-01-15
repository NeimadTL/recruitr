class Skill < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :position_skill_taggings
  has_many :positions, through: :position_skill_taggings

end
