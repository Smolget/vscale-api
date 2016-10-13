require 'spec_helper'

describe Vscale::Notifications do
  before(:each) do 
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
    @api.stub :put
  end

  describe "#notify" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("billing/notify")
      @api.notify
    end
  end

  describe "#update_notify" do
    it "calls #put with the correct url and params" do
      params = {:hello => :world}
      @api.should_receive(:put).with("billing/notify", params)
      @api.update_notify params
    end
  end


end
