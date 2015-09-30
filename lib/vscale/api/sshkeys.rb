module Vscale
  module SSHKeys
    def sshkeys
      get('sshkeys')
    end

    def sshkeys_new(params)
      post('sshkeys', params)
    end

    def sshkeys_delete(id)
      delete("sshkeys/#{id}")
    end
  end
end
