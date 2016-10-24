module Vscale
  module Servers
    def scalets # TODO: alias scalets
      get('scalets')
    end

    def new_scalet(params = {}) # TODO: alias Vscale::API::Scalets.new(params)
      post('scalets', params)
    end

    def find_scalet(id) # TODO: alias :scalet_info
      get("scalets/#{id}")
    end

    def restart_scalet(id)
      patch("scalets/#{id}/restart")
    end

    def stop_scalet(id)
      patch("scalets/#{id}/stop")
    end

    def start_scalet(id)
      patch("scalets/#{id}/start")
    end

    def upgrade_scalet(id, params)
      post("scalets/#{id}/upgrade", params)
    end

    def delete_scalet(id)
      delete("scalets/#{id}")
    end

    def task
      get('tasks')
    end

    def scalet_sshkeys(id, params)
      patch("sshkeys/scalets/#{id}", params)
    end

    def add_scalet_tag(params)
      post('scalets/tags', params)
    end

    def scalets_tags
      get('scalets/tags')
    end

    def scalet_tag(tag_id)
      get("scalets/tags/#{tag_id}")
    end

    def update_scalet_tag(tag_id, params)
      put("scalets/tags/#{tag_id}", params)
    end

    def remove_scalet_tag(tag_id)
      delete("scalets/tags/#{tag_id}")
    end
  end
end
