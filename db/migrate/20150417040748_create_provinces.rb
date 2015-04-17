class CreateProvinces < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TABLE provinces (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(50) NOT NULL,
            pst DECIMAL,
            gst DECIMAL,
            hst DECIMAL,
            created_at DATETIME NOT NULL,
            updated_at DATETIME NOT NULL
          );
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TABLE provinces;
        SQL
      end
    end
  end
end
