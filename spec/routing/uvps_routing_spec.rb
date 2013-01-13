require "spec_helper"

describe UvpsController do
  describe "routing" do

    it "routes to #index" do
      get("/uvps").should route_to("uvps#index")
    end

    it "routes to #new" do
      get("/uvps/new").should route_to("uvps#new")
    end

    it "routes to #show" do
      get("/uvps/1").should route_to("uvps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/uvps/1/edit").should route_to("uvps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/uvps").should route_to("uvps#create")
    end

    it "routes to #update" do
      put("/uvps/1").should route_to("uvps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/uvps/1").should route_to("uvps#destroy", :id => "1")
    end

  end
end
