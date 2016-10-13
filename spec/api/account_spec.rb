require 'spec_helper'

describe Vscale::Account do
  before(:each) do 
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
  end

  describe "#account" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("account")
      @api.account
    end
  end

end
