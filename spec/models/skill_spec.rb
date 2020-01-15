require 'rails_helper'

RSpec.describe Skill, type: :model do

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should have_many :position_skill_taggings }
  it { should have_many :positions }

end
