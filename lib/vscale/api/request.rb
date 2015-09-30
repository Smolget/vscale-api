module Vscale
  module Request
    API_ENDPOINT = 'https://api.vscale.io/v1/'.freeze

    VERB_MAP = {
      get: Net::HTTP::Get,
      put: Net::HTTP::Put,
      post: Net::HTTP::Post,
      delete: Net::HTTP::Delete
    }

    def get(path, params = {})
      request_json :get, path, params
    end

    def post(path, params = {})
      request_json :post, path, params
    end

    def put(path, params = {})
      request_json :put, path, params
    end

    def delete(path, params = {})
      request_json :delete, path, params
    end

    def patch(path, params = {})
      request_json :patch, path, params
    end
  end
end
