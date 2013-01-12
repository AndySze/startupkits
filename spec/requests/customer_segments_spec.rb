require 'spec_helper'

describe "CustomerSegments" do
  describe "GET /customer_segments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get customer_segments_path
      response.status.should be(200)
    end
  end
end
