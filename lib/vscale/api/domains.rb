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
  end
end
