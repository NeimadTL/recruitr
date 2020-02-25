class AddIndexesToUserSkillTaggings < ActiveRecord::Migration[6.0]
  def change
    add_index :user_skill_taggings, :user_id
    add_index :user_skill_taggings, :skill_id
  end
end
