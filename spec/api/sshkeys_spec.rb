require 'spec_helper'

describe Vscale::SSHKeys do
  before(:each) do 
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
    @api.stub :post
    @api.stub :delete
  end

  describe "#sshkeys" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("sshkeys")
      @api.sshkeys
    end
  end

  describe "#sshkeys_new" do
    it "calls #post with the correct url and params" do
      params = {:hello => :world}
      @api.should_receive(:post).with("sshkeys", params)
      @api.sshkeys_new params
    end
  end

  describe "#sshkeys_delete" do
    it "calls #delete with the correct url" do
      sshkey_id = 90210
      @api.should_receive(:delete).with("sshkeys/90210")
      @api.sshkeys_delete sshkey_id
    end
  end


end
