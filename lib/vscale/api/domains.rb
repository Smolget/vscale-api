module Vscale
  module Domains
    def domains(params = {})
      params.empty? ? get('domains') : post('domains', params)
    end
  end
end
