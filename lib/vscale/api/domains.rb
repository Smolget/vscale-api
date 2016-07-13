module Vscale
  module Domains
    def domains
      get('domains/')
    end

    def add_domain(params = {})
      post('domains/', params)
    end

    def domain_id(id)
      get("domains/#{id}")
    end

    alias_method :find_domain, :domain_id
    alias_method :domain_info, :domain_id

    def update_domain(domain_id, params = {})
      patch("domains/#{domain_id}", params)
    end

    alias_method :change_domain, :update_domain

    def remove_domain(domain_id)
      delete("domains/#{domain_id}")
    end

    alias_method :delete_domain, :remove_domain
    alias_method :rm_domain, :remove_domain

    ##  Domains Records
 
    def domain_records(domain_id)
      get("domains/#{domain_id}/records/")
    end 

    def add_domain_record(domain_id, params = {})
      post("domains/#{domain_id}/records/", params)
    end

    def update_domain_record(domain_id, record_id, params = {})
      put("domains/#{domain_id}/records/#{record_id}", params)
    end

    def remove_domain_record(domain_id, record_id)
      delete("domains/#{domain_id}/records/#{record_id}")
    end

    def domain_record(domain_id, record_id)
      get("domains/#{domain_id}/records/#{record_id}")
    end

    ## Domains Tags

    def add_domains_tags(params = {})
      post('domains/tags/', params)
    end

    def domains_tags
      get('domains/tags/')
    end

    def domains_tag_id(tag_id)
      get("domains/tags/#{tag_id}")
    end

    def update_domains_tag(tag_id, params = {})
      put("domains/tags/#{tag_id}")
    end

    def remove_domains_tag(tag_id, params = {})
      delete("domains/tags/#{tag_id}")
    end


    ## PTR Records

    def add_domains_ptr(params = {})
      post("domains/ptr/", params)
    end

    def domains_ptr
      get("domains/ptr/")
    end

    def domains_ptr_id(ptr_id)
      get("domains/ptr/#{ptr_id}")
    end

    def update_ptr_id(ptr_id, params = {})
      put("domains/ptr/#{ptr_id}", params)
    end

    def remove_ptr_id(ptr_id)
      delete("domains/ptr/#{ptr_id}")
    end
  end
end
