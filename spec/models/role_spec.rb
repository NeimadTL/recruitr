require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_one :user }
end
