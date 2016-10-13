require 'spec_helper'

describe Vscale::Backups do
  before(:each) do 
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
    @api.stub :delete
  end

  describe "#backups" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("backups")
      @api.backups
    end
  end

  describe "#backup" do
    it "calls #get with the correct url" do
      backup_id = 90210
      @api.should_receive(:get).with("backups/90210")
      @api.backup backup_id
    end
  end

  describe "#delete_backup" do
    it "calls #delete with the correct url" do
      backup_id = 90210
      @api.should_receive(:delete).with("backups/90210")
      @api.delete_backup backup_id
    end
  end

end
