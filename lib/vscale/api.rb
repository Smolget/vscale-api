require "ruby/vscale/api/version"
require "net/http"
require "uri"

  module Vscale
    module Api
      # Your code goes here...
      class Client
        API_ENDPOINT = 'https://api.vscale.io/v1/'

        def initialize(token)
          @token = token
        end

        ### ACCOUNT
        def account
          self.request({:method => 'account'})
        end

        def auth
          self.request ({:method => 'auth'})
        end

        ### SERVERS
        # GET
        def scalets_all
          #https://api.vscale.io/v1/scalets
        end

        # POST
        def scalets_new(params = {})
          #https://api.vscale.io/v1/scalets
        end

        # GET :id
        def scalets_show(params = {})
          #https://api.vscale.io/v1/scalets/:ctid
        end

        # PATCH
        def restart(params = {})
          #https://api.vscale.io/v1/scalets/:ctid/restart
        end

        # PATCH
        def stop(params = {})
          #https://api.vscale.io/v1/scalets/:ctid/stop
        end

        # PATCH
        def start(params = {})
          #https://api.vscale.io/v1/scalets/:ctid/start
        end

        # POST
        def upgrade(id)
          # https://api.vscale.io/v1/scalets/:ctid/upgrade
        end

        # DELETE
        def scalet_delete(id)
          # https://api.vscale.io/v1/scalets/:ctid
        end

        # GET
        def task
          # https://api.vscale.io/v1/tasks
        end

        # PATCH
        def scalet_sshkeys
          # https://api.vscale.io/v1/sshkeys/scalets/:ctid
        end


        ### BACKGROUND
        # GET
        def locations
          #https://api.vscale.io/v1/locations
        end

        # GET
        def images
          #https://api.vscale.io/v1/images
        end


        ### CONFIGURATIONS
        # GET
        def rplans
          #https://api.vscale.io/v1/rplans
        end

        # GET
        def prices
          #https://api.vscale.io/v1/billing/prices
        end


        ### SSHKEYS
        # GET
        def sshkeys
          #https://api.vscale.io/v1/sshkeys
        end

        # POST
        def sshkeys_new
          #https://api.vscale.io/v1/sshkeys
        end

        # DELETE
        def sshkeys_delete
          #https://api.vscale.io/v1/sshkeys
        end


        ### BILLING
        # GET
        def payments
          #https://api.vscale.io/v1/billing/payments
        end

        # GET
        def consumption
          #https://api.vscale.io/v1/billing/consumption?start=&end=
        end


        ### TICKETS
        # GET
        def tickets
          #https://api.vscale.io/v1/tickets
        end

        # POST
        def tickets_new
          #https://api.vscale.io/v1/tickets
        end

        # GET
        def ticket_comments
          #https://api.vscale.io/v1/tickets/:id/comments
        end

        # POST
        def tickets_add_comment
          #https://api.vscale.io/v1/tickets/:id/comments
        end

        # POST
        def tickets_close
          #https://api.vscale.io/v1/tickets/:id/close
        end

        #protected
        def request(param = '')
          url = URI.parse(API_ENDPOINT + param[:method].to_s)

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

        # TODO: make module request.post, request.get, request.update/patch, request.delete, request.put
        def request_post
          return true
        end

      end
    end
  end

