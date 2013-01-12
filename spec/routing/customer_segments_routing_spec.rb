require "spec_helper"

describe CustomerSegmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/customer_segments").should route_to("customer_segments#index")
    end

    it "routes to #new" do
      get("/customer_segments/new").should route_to("customer_segments#new")
    end

    it "routes to #show" do
      get("/customer_segments/1").should route_to("customer_segments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/customer_segments/1/edit").should route_to("customer_segments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/customer_segments").should route_to("customer_segments#create")
    end

    it "routes to #update" do
      put("/customer_segments/1").should route_to("customer_segments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/customer_segments/1").should route_to("customer_segments#destroy", :id => "1")
    end

  end
end
