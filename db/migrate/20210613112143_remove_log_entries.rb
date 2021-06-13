class RemoveLogEntries < ActiveRecord::Migration[5.2]
  def change
    drop_table :log_entries if table_exists?(:log_entries)
  end
end
