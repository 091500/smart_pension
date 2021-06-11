class CreateLogEntries < ActiveRecord::Migration[5.2]
  def up
    create_table :log_entries do |t|
      t.column :page_path, :string
      t.column :ip_address, :string
    end
  end

  def down
    drop_table :log_entries
  end
end
