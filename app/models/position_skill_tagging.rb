class PositionSkillTagging < ApplicationRecord

  validates :position_id, presence: true
  validates :skill_id, presence: true

  belongs_to :position
	belongs_to :skill

end
