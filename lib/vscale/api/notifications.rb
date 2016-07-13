module Vscale
  module Notifications
    def notify
      get('billing/notify')
    end

    def update_notify(params = {})
      put('billing/notify', params)
    end
  end
end
