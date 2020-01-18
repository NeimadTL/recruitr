require 'rails_helper'

RSpec.describe PositionSkillTagging, type: :model do

  it { should belong_to :position }
  it { should belong_to :skill }
  
end
