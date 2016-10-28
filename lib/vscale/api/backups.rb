module Vscale
  module Backups
    def create_backup(scalet_id)
      post("#{scalet_id}/backup")
    end

    def backups
      get('backups')
    end

    def backup(id)
      get("backups/#{id}")
    end

    def delete_backup(backup_id, params)
      delete("backups/#{backup_id}", params)
    end
  end
end
