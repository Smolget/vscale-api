module Vscale
  module Tokens
    def tokens(params = {})
      params.empty? ? get('tokens') : post('tokens', params)
    end

    def find_token(id)
      get("tokens/#{id}")
    end

    def update_token(id, params)
      post("tokens/#{id}", params)
    end

    def remove_token(id)
      delete("tokens/#{id}")
    end
  end
end