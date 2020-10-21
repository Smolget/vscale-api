
require 'vscale/api'

api = Vscale::Api::Client.new(ENV['VSCALE_TOPSECRET_TOKEN'])

# Images
api.images