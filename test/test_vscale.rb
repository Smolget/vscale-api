require 'minitest/autorun'

require 'net/http'
require 'openssl'
require 'ostruct'
require 'json'
require 'uri'

require 'vscale/api'

class APITest < MiniTest::Unit::TestCase
  def setup
    response = Vscale::Api::Client.new('2627bf1dc02449d7bba8e4368a521c612b097878df5241be1bb49325471c966f')
    puts response.account
    @data = JSON.parse response
  end

  def test_id_correct
    assert_equal '79043615885', @data['info']['mobile'].to_s
  end
end
