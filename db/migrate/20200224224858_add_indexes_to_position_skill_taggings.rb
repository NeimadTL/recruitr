class AddIndexesToPositionSkillTaggings < ActiveRecord::Migration[6.0]
  def change
    add_index :position_skill_taggings, :position_id
    add_index :position_skill_taggings, :skill_id
  end
end
