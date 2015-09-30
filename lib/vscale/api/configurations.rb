module Vscale
  module Configurations
    def rplans
      get('rplans')
    end

    def prices
      get('billing/prices')
    end
  end
end
