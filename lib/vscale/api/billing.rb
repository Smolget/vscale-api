module Vscale
  module Billing
    def payments
      get('billing/payments')
    end

    def consumption(params = {})
      get('billing/consumption', params)
    end

    def notify(params = {})
      params.empty? ? get('billing/notify') : put('billing/notify', params)
    end

    def update_notify(params = {})
      put('billing/notify', params)
    end

    def balance
      get('billing/balance')
    end
  end
end
