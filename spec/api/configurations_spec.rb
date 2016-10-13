require 'spec_helper'

describe Vscale::Configurations do
  before(:each) do
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
  end
  
  describe "#rplans" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("rplans")
      @api.rplans
    end
  end

  describe "#prices" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("billing/prices")
      @api.prices
    end
  end


end
