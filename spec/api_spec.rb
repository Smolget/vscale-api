require 'spec_helper'

describe '#account' do
  it 'api.account method' do
    api = Vscale::Api::Client.new(ENV['VSCALE_TOP_SECRET_KEY'])
    VCR.use_cassette('account/account.json') do
      account = api.account
      expect(account.username.locale).to eq('ru')
    end
  end
end
