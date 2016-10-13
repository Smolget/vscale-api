require 'spec_helper'

describe Vscale::Billing do
  before(:each) do 
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
  end

  describe "#payments" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("billing/payments/")
      @api.payments
    end
  end

  describe "#consumption" do
    it "calls #get with the correct url and params" do
      params = {:hello => :world}
      @api.should_receive(:get).with("billing/consumption", params)
      @api.consumption(params)
    end
  end


end
