require 'spec_helper'

describe Vscale::Servers do
  before(:each) do
    @api = Vscale::Api::Client.new('FAKE_TOKEN')
    @api.stub :get
    @api.stub :post
    @api.stub :patch
    @api.stub :delete
  end

  describe '#scalets' do
    it 'calls #get with the correct url' do
      @api.should_receive(:get).with('scalets')
      @api.scalets
    end
  end

  describe '#new_scalet' do
    it 'calls #post with the correct url and params' do
      params = { hello: :world }
      @api.should_receive(:post).with('scalets', params)
      @api.new_scalet params
    end
  end

  describe '#find_scalet' do
    it 'calls #get with the correct url' do
      scalet_id = 97
      @api.should_receive(:get).with('scalets/97')
      @api.find_scalet scalet_id
    end
  end

  describe '#restart_scalet' do
    it 'calls #patch with the correct url' do
      scalet_id = 97
      @api.should_receive(:patch).with('scalets/97/restart')
      @api.restart_scalet scalet_id
    end
  end

  describe '#stop_scalet' do
    it 'calls #patch with the correct url' do
      scalet_id = 97
      @api.should_receive(:patch).with('scalets/97/stop')
      @api.stop_scalet scalet_id
    end
  end

  describe '#start_scalet' do
    it 'calls #patch with the correct url' do
      scalet_id = 97
      @api.should_receive(:patch).with('scalets/97/start')
      @api.start_scalet scalet_id
    end
  end

  describe '#upgrade_scalet' do
    it 'calls #post with the correct url and params' do
      scalet_id = 97
      params = { hello: :world }
      @api.should_receive(:post).with('scalets/97/upgrade', params)
      @api.upgrade_scalet scalet_id, params
    end
  end

  describe '#delete_scalet' do
    it 'calls #delete with the correct url' do
      scalet_id = 97
      @api.should_receive(:delete).with('scalets/97')
      @api.delete_scalet scalet_id
    end
  end

  describe '#task' do
    it 'calls #get with the correct url' do
      @api.should_receive(:get).with('tasks')
      @api.task
    end
  end

  describe '#scalet_sshkeys' do
    it 'calls #patch with the correct url and params' do
      scalet_id = 90210
      params = {:hello => :world}
      @api.should_receive(:patch).with('sshkeys/scalets/90210',params)
      @api.scalet_sshkeys scalet_id, params
    end
  end

  describe '#add_scalet_tag' do
    it 'calls #post with correct url and params' do
      params = { :name => 'new_tag', :scalets => [42, 50] }
      @api.should_receive(:post).with('scalets/tags', params)
      @api.add_scalet_tag params
    end
  end

  describe '#scalets_tags' do
    it 'calls #get with correct url' do
      @api.should_receive(:get).with('scalets/tags')
      @api.scalets_tags
    end
  end

  describe '#scalet_tag' do
    it 'calls #get with correct url' do
      tag_id = 20
      @api.should_receive(:get).with('scalets/tags/20')
      @api.scalet_tag tag_id
    end
  end

  describe '#update_scalet_tag' do
    it 'calls #put with correct url and params' do
      tag_id = 20
      params = { :name => 'new_tag', :scalets => [1, 2, 3] }
      @api.should_receive(:put).with('scalets/tags/20', params)
      @api.update_scalet_tag tag_id, params
    end
  end

  describe '#remove_scalet_tag' do
    it 'call #delete with correct url' do
      tag_id = 20
      @api.should_receive(:delete).with('scalets/tags/20')
      @api.remove_scalet_tag tag_id
    end
  end
end
