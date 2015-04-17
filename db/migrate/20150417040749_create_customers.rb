class CreateCustomers < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE TABLE customers (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            first_name VARCHAR(50) NOT NULL,
            last_name VARCHAR(50) NOT NULL,
            address VARCHAR(255) NOT NULL,
            city VARCHAR(100) NOT NULL,
            postal_code VARCHAR(6) NOT NULL,
            email VARCHAR(100) NOT NULL,
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
