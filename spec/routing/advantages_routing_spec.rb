require "spec_helper"

describe AdvantagesController do
  describe "routing" do

    it "routes to #index" do
      get("/advantages").should route_to("advantages#index")
    end

    it "routes to #new" do
      get("/advantages/new").should route_to("advantages#new")
    end

    it "routes to #show" do
      get("/advantages/1").should route_to("advantages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/advantages/1/edit").should route_to("advantages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/advantages").should route_to("advantages#create")
    end

    it "routes to #update" do
      put("/advantages/1").should route_to("advantages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/advantages/1").should route_to("advantages#destroy", :id => "1")
    end

  end
end
