class CreatePositionSkillTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :position_skill_taggings do |t|
      t.integer :position_id, null: false
      t.integer :skill_id, null: false

      t.timestamps
    end

    add_index :position_skill_taggings, [:position_id, :skill_id], unique: true,
      name: 'position_skill_index'
  end
end
