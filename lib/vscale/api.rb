require 'net/http'
require 'openssl'
require 'ostruct'
require 'json'
require 'uri'

require 'vscale/api/account'
require 'vscale/api/background'
require 'vscale/api/backups'
require 'vscale/api/billing'
require 'vscale/api/configurations'
require 'vscale/api/domains'
require 'vscale/api/notifications'
require 'vscale/api/request'
require 'vscale/api/servers'
require 'vscale/api/sshkeys'
require 'vscale/api/version'

## TODO :
## API Chain: api.add_tag(params).restart_server(id)
## Batch Request: API_queue{job1, job2, job3}.batch

module Vscale
  module Api
    class Client
      include Account
      include Background
      include Backups
      include Billing
      include Configurations
      include Domains
      include Notifications
      include Request
      include Servers
      include SSHKeys

      def initialize(token, api_endpoint = API_ENDPOINT)
        @token = token
        @api_endpoint = api_endpoint

        uri = URI.parse(@api_endpoint)

        # TODO: rescue StandardError
        @http = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
        @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        @http.ssl_version = :TLSv1_2
      end

    private

      def request_json(meth, path, params = {})
        response = request(meth, path, params)
        body     = JSON.parse(response.body)
        OpenStruct.new(code: response.code, body: body)
      rescue JSON::ParserError
        response # TODO: convert to Hash
      end

      def request(meth, path, params = {})
        full_path = encode_path_params(@api_endpoint + path, params)
        request = VERB_MAP[meth.to_sym].new(full_path)
        request['Accept'] = 'application/json, text/plain'
        request['Content-Type'] = 'application/json'
        request['X-Token'] = @token

        request.set_form_data(params) if ['post', 'put', 'patch'].include?(meth)

        @http.request(request)
      end

      def encode_path_params(path, params)
        encoded = URI.encode_www_form(params)
        [path, encoded].join('?')
      end
    end
  end
end
