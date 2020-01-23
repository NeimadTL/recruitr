require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }

  it { should belong_to :role }

  it { should have_many :user_skill_taggings }
  it { should have_many :skills }

  it { should have_many :user_position_requests }
  it { should have_many :applications }

end
