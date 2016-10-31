module Vscale
  module Backups
    def create_backup(scalet_id, params)
      post("#{scalet_id}/backup", params)
    end

    def create_from_backup(scalet_id, params)
      patch("scalets/#{scalet_id}/rebuild", params)
    end

    def backups
      get('backups')
    end

    def backup(id)
      get("backups/#{id}")
    end

    def delete_backup(backup_id)
      delete("backups/#{backup_id}")
    end
  end
end
