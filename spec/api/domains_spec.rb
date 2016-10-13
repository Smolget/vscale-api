require 'spec_helper'

describe Vscale::Domains do
  before(:each) do
    @api = Vscale::Api::Client.new("FAKE_TOKEN")
    @api.stub :get
    @api.stub :post
    @api.stub :patch
    @api.stub :delete
  end

  describe "#domains" do
    it "calls #get with the correct url" do
      @api.should_receive(:get).with("domains/")
      @api.domains
    end
  end
  
  describe "#add_domain" do
    it "calls #post with the correct url and params" do
      params = {:hello => :world}
      @api.should_receive(:post).with("domains/", params)
      @api.add_domain params
    end
  end

  describe "#domain_id" do
    it "calls #get with the correct url" do
      domain_id = 90210
      @api.should_receive(:get).with("domains/90210")
      @api.domain_id domain_id
    end
  end

  describe "#update_domain" do
    it "calls #patch with the correct url and params" do
      domain_id = 90210
      params = {:hello => :world}
      @api.should_receive(:patch).with("domains/90210", params)
      @api.update_domain domain_id, params
    end
  end

  describe "#remove_domain" do
    it "calls #delete with the correct url" do
      domain_id = 90210
      @api.should_receive(:delete).with("domains/90210")
      @api.remove_domain domain_id
    end
  end

  describe "Domain Records" do

    describe "#domain_records" do
      it "calls #get with the correct url" do
        domain_id = 90210
        @api.should_receive(:get).with("domains/90210/records/")
        @api.domain_records domain_id
      end
    end

    describe "#add_domain_record" do
      it "calls #post with the correct url and params" do
        domain_id = 90210
        params = {:hello => :world}
        @api.should_receive(:post).with("domains/90210/records/", params)
        @api.add_domain_record domain_id, params
      end
    end

    describe "#update_domain_record" do
      it "calls #put with the correct url and params" do
        domain_id = 90210
        record_id = 90211
        params = {:hello => :world}
        @api.should_receive(:put).with("domains/90210/records/90211", params)
        @api.update_domain_record domain_id, record_id, params
      end
    end

    describe "#remove_domain_record" do
      it "calls #delete with the correct url" do
        domain_id = 90210
        record_id = 90211
        @api.should_receive(:delete).with("domains/90210/records/90211")
        @api.remove_domain_record domain_id, record_id
      end
    end

    describe "#domain_record" do
      it "calls #get with the correct url" do
        domain_id = 90210
        record_id = 90211
        @api.should_receive(:get).with("domains/90210/records/90211")
        @api.domain_record domain_id, record_id
      end
    end

  end #describe "Domain Records" do

  describe "Domain Tags" do

    describe "#add_domains_tags" do
      it "calls #post with the correct url and params" do
        params = {:hello => :world}
        @api.should_receive(:post).with("domains/tags/", params)
        @api.add_domains_tags params
      end
    end

    describe "#domains_tags" do
      it "calls #get with the correct url" do
        @api.should_receive(:get).with("domains/tags/")
        @api.domains_tags
      end
    end

    describe "#domains_tag_id" do
      it "calls #get with the correct url" do
        tag_id = 90210
        @api.should_receive(:get).with("domains/tags/90210")
        @api.domains_tag_id tag_id
      end
    end

    describe "#update_domains_tag" do
      it "calls #put with the correct url and params" do
        tag_id = 90210
        params = {:hello => :world}
        @api.should_receive(:put).with("domains/tags/90210", params)
        @api.update_domains_tag tag_id, params
      end
    end

    describe "#remove_domains_tag" do
      it "calls #delete with the correct url" do
        tag_id = 90210
        @api.should_receive(:delete).with("domains/tags/90210")
        @api.remove_domains_tag tag_id
      end
    end

  end #describe "Domain Tags" do

  describe "PTR Records" do

    describe "#add_domains_ptr" do
      it "calls #post with the correct url and params" do
        params = {:hello => :world}
        @api.should_receive(:post).with("domains/ptr/", params)
        @api.add_domains_ptr(params)
      end
    end

    describe "#domains_ptr" do
      it "calls #get with the correct url" do
        @api.should_receive(:get).with("domains/ptr/")
        @api.domains_ptr
      end
    end

    describe "#domains_ptr_id" do
      it "calls #get with the correct url" do
        ptr_id = 90210
        @api.should_receive(:get).with("domains/ptr/90210")
        @api.domains_ptr_id(ptr_id)
      end
    end

    describe "#update_ptr_id" do
      it "calls #put with the correct url and params" do
        ptr_id = 90210
        params = {:hello => :world}
        @api.should_receive(:put).with("domains/ptr/90210", params)
        @api.update_ptr_id(ptr_id,params)
      end
    end

    describe "#remove_ptr_id" do
      it "calls #delete with the correct url" do
        ptr_id = 90210
        @api.should_receive(:delete).with("domains/ptr/90210")
        @api.remove_ptr_id(ptr_id)
      end
    end

  end #describe "PTR Records" do

end
