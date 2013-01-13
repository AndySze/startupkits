require "spec_helper"

describe MetricsController do
  describe "routing" do

    it "routes to #index" do
      get("/metrics").should route_to("metrics#index")
    end

    it "routes to #new" do
      get("/metrics/new").should route_to("metrics#new")
    end

    it "routes to #show" do
      get("/metrics/1").should route_to("metrics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/metrics/1/edit").should route_to("metrics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/metrics").should route_to("metrics#create")
    end

    it "routes to #update" do
      put("/metrics/1").should route_to("metrics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/metrics/1").should route_to("metrics#destroy", :id => "1")
    end

  end
end
