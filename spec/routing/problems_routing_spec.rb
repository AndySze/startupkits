require "spec_helper"

describe ProblemsController do
  describe "routing" do

    it "routes to #index" do
      get("/problems").should route_to("problems#index")
    end

    it "routes to #new" do
      get("/problems/new").should route_to("problems#new")
    end

    it "routes to #show" do
      get("/problems/1").should route_to("problems#show", :id => "1")
    end

    it "routes to #edit" do
      get("/problems/1/edit").should route_to("problems#edit", :id => "1")
    end

    it "routes to #create" do
      post("/problems").should route_to("problems#create")
    end

    it "routes to #update" do
      put("/problems/1").should route_to("problems#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/problems/1").should route_to("problems#destroy", :id => "1")
    end

  end
end
