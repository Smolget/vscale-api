require 'spec_helper'

describe Vscale::Backups do
  before(:each) do
    @api = Vscale::Api::Client.new('FAKE_TOKEN')
    @api.stub :get
    @api.stub :delete
  end

  describe '#backups' do
    it 'calls #get with the correct url' do
      @api.should_receive(:get).with('backups')
      @api.backups
    end
  end

  describe '#backup' do
    it 'calls #get with the correct url' do
      backup_id = 97
      @api.should_receive(:get).with('backups/97')
      @api.backup backup_id
    end
  end

  describe '#delete_backup' do
    it 'calls #delete with the correct url' do
      backup_id = 97
      @api.should_receive(:delete).with('backups/97')
      @api.delete_backup backup_id
    end
  end

  describe '#create_backup' do
    it 'calls #post with the correct url and params' do
      scalet_id = 98
      params = { :name => "My Backup" }
      @api.should_receive(:post).with('98/backup', params)
      @api.create_backup scalet_id, params
    end
  end

  describe '#create_from_backup' do
    it 'calls #patch with the correct url and params' do
      scalet_id = 42590
      params = { 
        :make_from => "294374c0-0fb9-4ab6-853c-e0a11fde4906" 
      }
      @api.should_receive(:post).with('42590/rebuild', params)
      @api.create_from_backup scalet_id, params
    end
  end
end
