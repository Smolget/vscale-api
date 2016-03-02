module Vscale
  module Domains
    def domains(params = {})
      # get('domains/')
      params.empty? ? get('domains/') : post('domains/', params)
    end

    def find_domain(domain_id)
      get("domains/#{domain_id}")
    end

    def update_domain(domain_id, params)
      patch("domains/#{domain_id}", params)
    end

    def delete_domain(domain_id, params)
      delete("domains/#{domain_id}", params)
    end

    alias_method :remove_domain, :delete_domain
    alias_method :rm_domain, :delete_domain

    def get_domain_records(domain_id)
      get("domains/#{domain_id}/records/")
    end

    def get_domain_record(domain_id, record_id)
      get("domains/#{domain_id}/records/#{record_id}")
    end

    def add_domain_record(domain_id, params)
      post("domains/#{domain_id}/records/", params)
    end

    def update_domain_record(domain_id, record_id, params)
      put("domains/#{domain_id}/records/#{record_id}", params)
    end

    def delete_domain_record(domain_id, record_id, params)
      delete("domains/#{domain_id}/records/#{record_id}", params)
    end

    # TAGS

    def add_tags(params)
      post('domains/tags/', params)
    end

    def tags
      get('domains/tags')
    end

    def find_tag(tag_id)
      get("domains/#{tag_id}")
    end

    alias_method :tag_id, :find_tag
    alias_method :tag_info, :find_tag

    def update_tag(tag_id, params)
      put("domains/tags/#{tag_id}", params)
    end

    def delete_tag(tag_id)
      delete("domains/tags/#{tag_id}")
    end

    alias_method :remove_tag, :delete_tag
    alias_method :rm_tag, :delete_tag

    # PTR Records
    def add_domain_ptr(params)
      post('domains/ptr/', params)
    end

    alias_method :add_ptr, :add_domain_ptr

    def ptr_records
      get('domains/ptr/')
    end

    alias_method :ptr, :ptr_records

    def get_domain_ptr(ptr_id)
      get("domains/ptr/#{ptr_id}")
    end

    def update_domain_ptr(ptr_id, params)
      put("domains/ptr/#{ptr_id}", params)
    end

    def delete_domain_ptr(ptr_id)
      delete("domains/ptr/#{ptr_id}")
    end
  end
end
