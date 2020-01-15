require 'rails_helper'

RSpec.describe "positions/index", type: :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        :title => "Title"
      ),
      Position.create!(
        :title => "Title"
      )
    ])
  end

  xit "renders a list of positions" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
