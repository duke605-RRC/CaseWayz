class CreateCustomers < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TABLE customers (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            first_name VARCHAR(50) NOT NULL,
            last_name VARCHAR(50) NOT NULL,
            address TEXT NOT NULL,
            city TEXT NOT NULL,
            postal_code TEXT NOT NULL,
            email TEXT NOT NULL,
            province_id INTEGER NOT NULL,
            created_at DATETIME NOT NULL,
            updated_at DATETIME NOT NULL,
            FOREIGN KEY (province_id) REFERENCES provinces
          );
        SQL
      end

      dir.down do
        execute <<-SQL
          DROP TABLE customers;
        SQL
      end
    end
  end
end
