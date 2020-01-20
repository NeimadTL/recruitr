require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }

  it { should belong_to :role }
  
end
