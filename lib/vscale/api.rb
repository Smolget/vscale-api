require 'vscale/api/version'
require 'net/http'
require 'openssl'
require 'ostruct'
require 'json'
require 'uri'

require 'vscale/api/request'
require 'vscale/api/tokens'
require 'vscale/api/account'

module Vscale
  module Api
    class Client
      include Request
      include Tokens
      include Account
      def initialize(token, api_endpoint = API_ENDPOINT)
        @token = token
        @api_endpoint = api_endpoint

        uri = URI.parse(@api_endpoint)

        @http = Net::HTTP.start(uri.host, uri.port, use_ssl: true)
        @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        @http.ssl_version = :TLSv1_2
      end

      ### SERVERS
      def scalets # TODO: alias scalets
        # https://api.vscale.io/v1/scalets
        get('scalets')
      end

      def new_scalet(params = {}) # TODO: alias Vscale::API::Scalets.new(params)
        # https://api.vscale.io/v1/scalets
        post('scalets', params)
      end

      def find_scalet(id) # TODO: alias :scalet_info
        # https://api.vscale.io/v1/scalets/:ctid
        get("scalets/#{id}")
      end

      def restart_scalet(id)
        # https://api.vscale.io/v1/scalets/:ctid/restart
        patch("scalets/#{id}/restart")
      end

      def stop_scalet(id)
        # https://api.vscale.io/v1/scalets/:ctid/stop
        patch("scalets/#{id}/stop")
      end

      def start_scalet(id)
        # https://api.vscale.io/v1/scalets/:ctid/start
        patch("scalets/#{id}/start")
      end

      def upgrade_scalet(id, params)
        # https://api.vscale.io/v1/scalets/:ctid/upgrade
        post("scalets/#{id}/upgrade", params)
      end

      def delete_scalet(id)
        # https://api.vscale.io/v1/scalets/:ctid
        delete("scalets/#{id}")
      end

      def task
        # https://api.vscale.io/v1/tasks
        get('tasks')
      end

      def scalet_sshkeys(params)
        # https://api.vscale.io/v1/sshkeys/scalets/:ctid
        patch("sshkeys/scalets/#{id}", params)
      end

      ### BACKGROUND
      def locations
        # https://api.vscale.io/v1/locations
        get('locations')
      end

      def images
        # https://api.vscale.io/v1/images
        get('images')
      end

      ### CONFIGURATIONS
      def rplans
        # https://api.vscale.io/v1/rplans
        get('rplans')
      end

      def prices
        # https://api.vscale.io/v1/billing/prices
        get('billing/prices')
      end

      ### SSHKEYS
      def sshkeys
        # https://api.vscale.io/v1/sshkeys
        get('sshkeys')
      end

      def sshkeys_new(params)
        # https://api.vscale.io/v1/sshkeys
        post('sshkeys', params)
      end

      def sshkeys_delete(id)
        # https://api.vscale.io/v1/sshkeys/:key
        delete("sshkeys/#{id}")
      end

      ### BILLING
      def payments
        # https://api.vscale.io/v1/billing/payments
        get('billing/payments')
      end

      def consumption(params)
        # https://api.vscale.io/v1/billing/consumption?start=&end=
        get('billing/consumption', params)
      end

      ### TICKETS
      def tickets
        # https://api.vscale.io/v1/tickets
        get('tickets')
      end

      def tickets_new(params)
        # https://api.vscale.io/v1/tickets
        post('tickets', params)
      end

      def ticket_comments
        # https://api.vscale.io/v1/tickets/:id/comments
        get("tickets/#{id}/comments")
      end

      def tickets_add_comment(params)
        # https://api.vscale.io/v1/tickets/:id/comments
        post('tickets', params)
      end

      def tickets_close(id)
        # https://api.vscale.io/v1/tickets/:id/close
        post("tickets/#{id}/close")
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
