require 'net/http'
require 'openssl'
require 'ostruct'
require 'json'
require 'uri'

require 'vscale/api/account'
require 'vscale/api/background'
require 'vscale/api/billing'
require 'vscale/api/configurations'
require 'vscale/api/request'
require 'vscale/api/servers'
require 'vscale/api/sshkeys'
require 'vscale/api/tickets'
require 'vscale/api/tokens'
require 'vscale/api/version'

module Vscale
  module Api
    class Client
      include Account
      include Background
      include Billing
      include Configurations
      include Request
      include Servers
      include SSHKeys
      include Tickets
      include Tokens
      def initialize(token, api_endpoint = API_ENDPOINT)
        @token = token
        @api_endpoint = api_endpoint

        uri = URI.parse(@api_endpoint)

        @http = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
        @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        @http.ssl_version = :TLSv1_2
      end

      private

      def request_json(method, path, params)
        response = request(method, path, params)
        body = JSON.parse(response.body)

        OpenStruct.new(code: response.code, body: body)

      rescue JSON::ParserError
        response
      end

      def request(method, path, params = {})
        full_path = encode_path_params(@api_endpoint + path, params)
        request = VERB_MAP[method.to_sym].new(full_path)
        request['Accept'] = 'application/json, text/plain'
        request['Content-Type'] = 'application/json'
        request['X-Token'] = @token
        @http.request(request)
      end

      def encode_path_params(path, params)
        encoded = URI.encode_www_form(params)
        [path, encoded].join('?')
      end
    end
  end
end