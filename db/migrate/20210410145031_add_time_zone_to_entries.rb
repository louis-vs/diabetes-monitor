class AddTimeZoneToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :time_zone, :string, null: false, default: 'Europe/London'

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE entries
            SET entries.time = entries.time - interval '1 hour';
        SQL
      end
      dir.down do
        execute <<-SQL
          UPDATE entries
            SET entries.time = entries.time + interval '1 hour';
        SQL
      end
    end
  end
end
