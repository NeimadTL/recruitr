require 'rails_helper'

RSpec.describe Position, type: :model do

  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :description }

  it { should have_many :position_skill_taggings }
  it { should have_many :skills }

  it { should have_many :user_position_requests }
  it { should have_many :candidates }

end
