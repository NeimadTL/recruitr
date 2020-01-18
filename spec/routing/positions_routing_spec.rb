require "rails_helper"

RSpec.describe Hr::PositionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "hr/positions").to route_to("hr/positions#index")
    end

    it "routes to #new" do
      expect(:get => "hr/positions/new").to route_to("hr/positions#new")
    end

    it "routes to #show" do
      expect(:get => "hr/positions/1").to route_to("hr/positions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "hr/positions/1/edit").to route_to("hr/positions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "hr/positions").to route_to("hr/positions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "hr/positions/1").to route_to("hr/positions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "hr/positions/1").to route_to("hr/positions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "hr/positions/1").to route_to("hr/positions#destroy", :id => "1")
    end
  end
end
