require 'spec_helper'

describe Vscale::Servers do
  before(:each) do 
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
    @api.stub :post
    @api.stub :patch
    @api.stub :delete
  end

  describe "#scalets" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("scalets")
      @api.scalets
    end
  end

  describe "#new_scalet" do
    it "calls #post with the correct url and params" do
      params = {:hello => :world}
      @api.should_receive(:post).with("scalets", params)
      @api.new_scalet params
    end
  end

  describe "#find_scalet" do
    it "calls #get with the correct url" do
      scalet_id = 90210
      @api.should_receive(:get).with("scalets/90210")
      @api.find_scalet scalet_id
    end
  end

  describe "#restart_scalet" do
    it "calls #patch with the correct url" do
      scalet_id = 90210
      @api.should_receive(:patch).with("scalets/90210/restart")
      @api.restart_scalet scalet_id
    end
  end

  describe "#stop_scalet" do
    it "calls #patch with the correct url" do
      scalet_id = 90210
      @api.should_receive(:patch).with("scalets/90210/stop")
      @api.stop_scalet scalet_id
    end
  end

  describe "#start_scalet" do
    it "calls #patch with the correct url" do
      scalet_id = 90210
      @api.should_receive(:patch).with("scalets/90210/start")
      @api.start_scalet scalet_id
    end
  end

  describe "#upgrade_scalet" do
    it "calls #post with the correct url and params" do
      scalet_id = 90210
      params = {:hello => :world}
      @api.should_receive(:post).with("scalets/90210/upgrade", params)
      @api.upgrade_scalet scalet_id, params
    end
  end

  describe "#delete_scalet" do
    it "calls #delete with the correct url" do
      scalet_id = 90210
      @api.should_receive(:delete).with("scalets/90210")
      @api.delete_scalet scalet_id
    end
  end

  describe "#task" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("tasks")
      @api.task
    end
  end

  # Looks like servers.rb had an error when I wrote this
  # Assuming it follows all other calls, 
  # you should be able to uncomment once it's ready:

  #describe "#scalet_sshkeys" do
  #  it "calls #patch with the correct url and params" do
  #    scalet_id = 90210
  #    params = {:hello => :world}
  #    @api.should_receive(:patch).with("sshkeys/scalets/90210",params)
  #    @api.scalet_sshkeys scalet_id, params
  #  end
  #end


end
