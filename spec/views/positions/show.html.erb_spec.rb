require 'rails_helper'

RSpec.describe "positions/show", type: :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      :title => "Title"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
