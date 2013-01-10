require "spec_helper"

describe IdeasController do
  describe "routing" do

    it "routes to #index" do
      get("/ideas").should route_to("ideas#index")
    end

    it "routes to #new" do
      get("/ideas/new").should route_to("ideas#new")
    end

    it "routes to #show" do
      get("/ideas/1").should route_to("ideas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ideas/1/edit").should route_to("ideas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ideas").should route_to("ideas#create")
    end

    it "routes to #update" do
      put("/ideas/1").should route_to("ideas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ideas/1").should route_to("ideas#destroy", :id => "1")
    end

  end
end
