require 'rails_helper'

RSpec.describe PositionSkillTagging, type: :model do

  it { should validate_presence_of :position_id }
  it { should validate_presence_of :skill_id }

  it { should belong_to :position }
  it { should belong_to :skill }
end
