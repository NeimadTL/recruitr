require 'rails_helper'

RSpec.describe Position, type: :model do

  it { should validate_presence_of :title }
  it { should validate_uniqueness_of :title }

end
