module Vscale
  module Backups
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
