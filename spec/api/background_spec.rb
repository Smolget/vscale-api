require 'spec_helper'

describe Vscale::Background do
  before(:each) do 
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
  end

  describe "#locations " do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("locations")
      @api.locations
    end
  end

  describe "#images" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("images")
      @api.images
    end
  end

end
