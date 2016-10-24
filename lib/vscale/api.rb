require 'net/http'
require 'openssl'
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

      def initialize(token)
        @token = token

        uri = URI.parse(API_ENDPOINT)

        # TODO: rescue StandardError
        @http = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
        @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        @http.ssl_version = :TLSv1_2
      end

    private

      def request_json(meth, path, params = {})
        response = request(meth, path, params)

        result = Struct.new(:code, :body)

        if response.body.nil? || response.body.empty?
          result.new(nil, nil)
        else
          json_body = JSON.parse(response.body, quirks_mode: true) # TODO: TypeError if nil
          result.new(response.code, json_body)
        end
      end

      def request(meth, path, params = {})
        full_path = encode_path_params([API_ENDPOINT, path].join, params)
        
        request = VERB_MAP[meth.to_sym].new(full_path)
        
        request['Accept'] = 'application/json, text/plain'
        request['Content-Type'] = 'application/json'
        request['X-Token'] = @token

        if ['post', 'put', 'patch'].include?(meth.to_s)
          request.body = params.to_json
          return @http.request(request)
        end
        @http.request(request)
      end

      def encode_path_params(path, params)
        [path, URI.encode_www_form(params)].join('?')
      end
    end
  end
end
