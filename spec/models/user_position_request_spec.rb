require 'rails_helper'

RSpec.describe UserPositionRequest, type: :model do

  it { should belong_to :user }
  it { should belong_to :position }
  
end
