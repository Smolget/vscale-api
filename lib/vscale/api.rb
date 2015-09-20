require "vscale/api/version"
require "net/http"
require "openssl"
require "ostruct"
require "json"
require "uri"

module Vscale
  module Api
    class Client

      API_ENDPOINT = 'https://api.vscale.io/v1/'

      VERB_MAP = {
          :get    => Net::HTTP::Get,
          :post   => Net::HTTP::Post,
          :put    => Net::HTTP::Put,
          :delete => Net::HTTP::Delete
      }

      def initialize(token, api_endpoint = API_ENDPOINT)
        @token = token
        @api_endpoint = api_endpoint

        uri = URI.parse(@api_endpoint)

        @http = Net::HTTP.start(uri.host, uri.port, :use_ssl => true)
        @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        @http.ssl_version = :SSLv3
      end

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

      ### TOKENS
      def tokens(params={})
        if params.empty?
          self.get("tokens")
        else
          self.post("tokens", params)
        end
      end

      def find_token(id)
        self.get("tokens/#{id}")
      end

      def update_token(id, params)
        self.post("tokens/#{id}", params)
      end

      def remove_token(id)
        self.delete("tokens/#{id}")
      end


      ### ACCOUNT
      def account
        self.get("account")
      end

      def auth
        #self.request ({:method => 'auth'})
        self.get("auth")
      end

      ### SERVERS
      # GET
      def scalets #alias scalets
        self.get("scalets")
        #https://api.vscale.io/v1/scalets
      end

      # POST
      def new_scalet(params = {}) # alias Vscale::API::Scalets.new(params)
        #https://api.vscale.io/v1/scalets
        self.post("scalets", params)
      end

      # GET :id
      def find_scalet(id) # alias :scalet_info
        self.get("scalets/#{id}")
        #https://api.vscale.io/v1/scalets/:ctid
      end

      # PATCH
      def restart_scalet(id)
        #https://api.vscale.io/v1/scalets/:ctid/restart
        self.patch("scalets/#{id}/restart")
      end

      # PATCH
      def stop_scalet(id)
        self.patch("scalets/#{id}/stop")
        #https://api.vscale.io/v1/scalets/:ctid/stop
      end

      # PATCH
      def start_scalet(id)
        self.patch("scalets/#{id}/start")
        #https://api.vscale.io/v1/scalets/:ctid/start
      end

      # POST
      def upgrade_scalet(id, params)
        self.post("scalets/#{id}/upgrade", params)
        # https://api.vscale.io/v1/scalets/:ctid/upgrade
      end

      # DELETE
      def delete_scalet(id)
        # https://api.vscale.io/v1/scalets/:ctid
        self.delete("scalets/#{id}")
      end

      # GET
      def task
        # https://api.vscale.io/v1/tasks
        self.get("tasks")
      end

      # PATCH
      def scalet_sshkeys(params)
        self.patch("sshkeys/scalets/#{id}", params)
        # https://api.vscale.io/v1/sshkeys/scalets/:ctid
      end


      ### BACKGROUND
      # GET
      def locations
        self.get("locations")
        #https://api.vscale.io/v1/locations
      end

      # GET
      def images
        self.get("images")
        #https://api.vscale.io/v1/images
      end


      ### CONFIGURATIONS
      # GET
      def rplans
        self.get("rplans")
        #https://api.vscale.io/v1/rplans
      end

      # GET
      def prices
        self.get("billing/prices")
        #https://api.vscale.io/v1/billing/prices
      end


      ### SSHKEYS
      # GET
      def sshkeys
        self.get("sshkeys")
        #https://api.vscale.io/v1/sshkeys
      end

      # POST
      def sshkeys_new(params)
        self.post("sshkeys", params)
        #https://api.vscale.io/v1/sshkeys
      end

      # DELETE
      def sshkeys_delete(id)
        self.delete("sshkeys/#{id}")
        #https://api.vscale.io/v1/sshkeys/:key
      end


      ### BILLING
      # GET
      def payments
        #https://api.vscale.io/v1/billing/payments
        self.get("billing/payments")
      end

      # GET
      def consumption(params)
        #https://api.vscale.io/v1/billing/consumption?start=&end=
        self.get("billing/consumption", params)
      end


      ### TICKETS
      # GET
      def tickets
        #https://api.vscale.io/v1/tickets
        self.get("tickets")
      end

      # POST
      def tickets_new(params)
        #https://api.vscale.io/v1/tickets
        self.post("tickets", params)
      end

      # GET
      def ticket_comments
        #https://api.vscale.io/v1/tickets/:id/comments
        self.get("tickets/#{id}/comments")
      end

      # POST
      def tickets_add_comment(params)
        #https://api.vscale.io/v1/tickets/:id/comments
        self.post("tickets", params)
      end

      # POST
      def tickets_close(id)
        #https://api.vscale.io/v1/tickets/:id/close
        self.post("tickets/#{id}/close")
      end

      #protected
      def request_old(param = '')
        url = URI.parse(@api_endpoint + param[:method].to_s)

        req = Net::HTTP::Get.new url.path
        req.add_field("Accept", "application/json, text/plain")
        req.add_field("Content-Type", 'application/json')
        req.add_field("X-Token", @token)

        #response = Net::HTTP.post_form(URI.parse(API_ENDPOINT), params.map(&:to_a).map{|x| x.join('=')}.join('&') )

        response = Net::HTTP.start(url.host, url.port, :use_ssl => true) do |http|
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          http.ssl_version = :SSLv3
          http.request req
        end

        response.body
      end

      #private

      def request_json(method, path, params)
        response = request(method, path, params)
        body = JSON.parse(response.body)

        OpenStruct.new(:code => response.code, :body => body)
      rescue JSON::ParserError
        response
      end

      def request(method, path, params = {})
        case method
          when :get
            full_path = encode_path_params(@api_endpoint + path, params)
            request = VERB_MAP[method.to_sym].new(full_path)
            request["Accept"] = "application/json, text/plain"
            request["Content-Type"] = 'application/json'
            request["X-Token"] = @token
            p full_path
          else
            full_path = encode_path_params(@api_endpoint + path, params)
            request = VERB_MAP[method.to_sym].new(full_path)
            request["Accept"] = "application/json, text/plain"
            request["Content-Type"] = 'application/json'
            request["X-Token"] = @token
            p full_path
        end

        @http.request(request)
      end

      def encode_path_params(path, params)
        encoded = URI.encode_www_form(params)
        [path, encoded].join("?") # if params  {}
      end

    end
  end
end

