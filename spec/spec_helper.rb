require 'bundler/setup'
# require 'coveralls'
require 'vscale/api'
require 'webmock/rspec'
require 'vcr'

Bundler.setup
# Coveralls.wear!

WebMock.disable_net_connect!(allow_localhost: true)

# RSpec.configure do |config|
# some (optional) config here
# end
